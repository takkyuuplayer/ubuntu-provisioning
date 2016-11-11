%w{
  libmysqlclient-dev
  mysql-client
  mysql-common
  mysql-server
}.each do |pkg|
  package pkg
end

service "mysql" do
  action [:enable, :start]
end

execute "Create time zones" do
  command <<-CMD
    mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot mysql
  CMD
end

