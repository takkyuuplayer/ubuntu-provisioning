execute 'add-apt-repository ppa:nginx/stable' do
  command <<-CMD
    add-apt-repository ppa:nginx/stable <<EOF &&
EOF
    apt-get update -y
  CMD
  not_if 'ls -al /etc/apt/sources.list.d/ | grep nginx'
end

package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end

%w(/web).each do |dir|
  directory dir do
    action :create
    owner "root"
    group node[:user][:group]
    mode "775"
  end
end

%w(/var/cache/nginx).each do |dir|
  directory dir do
    action :create
    owner "www-data"
    group "www-data"
  mode "775"
  end
end

directory "/var/cache/nginx" do
  action :create
  owner "www-data"
  group "www-data"
  mode "775"
end

directory "/var/cache/nginx" do
  action :create
  owner "www-data"
  group "www-data"
  mode "775"
end

template "/etc/nginx/conf.d/log_format.conf" do
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[nginx]'
end

template "/etc/logrotate.d/nginx" do
  mode "644"
  owner 'root'
  group 'root'
  action :create
end
