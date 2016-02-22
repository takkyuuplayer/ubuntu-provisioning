%w(
apache2
).each do |pkg|
  package pkg do
    action :install
  end
end

file "/etc/apache2/ports.conf" do
  action :edit
  block do |content|
    content.gsub!("Listen 80", "Listen 10080")
    content.gsub!("Listen 443", "Listen 10443")
  end
  notifies :restart, 'service[apache2]'
end

file "/etc/php5/apache2/php.ini" do
  action :edit
  block do |content|
    content.gsub!(";date.timezone =", "date.timezone = Asia/Tokyo")
  end
  notifies :restart, 'service[apache2]'
end

file "/usr/share/zabbix/conf/zabbix.conf.php" do
  owner 'root'
  group 'root'
  mode  '644'
  content <<-PHP
<?php
// Zabbix GUI configuration file.
global $DB;

$DB['TYPE']     = 'MYSQL';
$DB['SERVER']   = 'localhost';
$DB['PORT']     = '0';
$DB['DATABASE'] = 'zabbix';
$DB['USER']     = 'root';
$DB['PASSWORD'] = '';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = '';

$ZBX_SERVER      = 'localhost';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = '';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
  PHP
end

service 'apache2' do
  action [:enable, :start]
end
