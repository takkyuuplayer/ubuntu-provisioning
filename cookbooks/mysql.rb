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

node[:mysql][:databases].keys.each do |db_name|
  execute "Create database #{db_name}" do
    command <<-CMD
      mysql -uroot -e "CREATE DATABASE IF NOT EXISTS #{db_name} DEFAULT CHARSET=utf8"
    CMD
  end

  if node[:mysql][:databases][db_name].has_key?(:users) then
    if node[:mysql][:databases][db_name][:users].has_key?(:master) then
      config = node[:mysql][:databases][db_name][:users][:master]

      execute "Create master user #{config[:username]} for DB #{db_name}" do
        command <<-CMD
          mysql -uroot -e "GRANT ALL PRIVILEGES \
          ON \\`#{db_name}\\`.* \
          TO '#{config[:username]}'@'#{config[:host]}' \
          IDENTIFIED BY '#{config[:password]}';"
        CMD
      end
    end
    if node[:mysql][:databases][db_name][:users].has_key?(:slave) then
      config = node[:mysql][:databases][db_name][:users][:slave]

      execute "Create slave user #{config[:username]} for DB #{db_name}" do
        command <<-CMD
          mysql -uroot -e "GRANT SELECT, SHOW VIEW \
          ON \\`#{db_name}\\`.* \
          TO '#{config[:username]}'@'#{config[:host]}' \
          IDENTIFIED BY '#{config[:password]}';"
        CMD
      end
    end
  end
end
