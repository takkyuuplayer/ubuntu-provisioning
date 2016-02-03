execute 'dpkg zabbix' do
  cwd '/tmp'
  command <<-CMD
wget http://repo.zabbix.com/zabbix/2.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb &&
dpkg -i /tmp/zabbix-release_2.4-1+trusty_all.deb &&
apt-get update
  CMD
  not_if 'dpkg -l | grep zabbix'
end

%w(
zabbix-server-mysql
zabbix-frontend-php
).each do |pkg|
  package pkg do
    action :install
  end
end
