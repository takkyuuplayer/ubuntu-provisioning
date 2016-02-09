execute 'add dpkg repo' do
  command 'wget http://repo.zabbix.com/zabbix/2.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb &&
    dpkg -i zabbix-release_2.4-1+trusty_all.deb &&
    apt-get update
  '
end

%w(
apache2
zabbix-agent
zabbix-frontend-php
zabbix-server-mysql
).each do |pkg|
  package pkg do
    action :install
  end
end

service 'apache2' do
  action [:enable, :start]
end
