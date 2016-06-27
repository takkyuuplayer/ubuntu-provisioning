execute 'add-apt-repository ppa:nginx/stable' do
  command <<-CMD
    add-apt-repository ppa:nginx/stable <<EOF &&
EOF
    apt-get update -y
  CMD
  not_if 'ls -al /etc/apt/sources.list.d/ | grep nginx'
end

service 'nginx' do
  action [:enable, :start]
end

package 'nginx' do
  action :install
end

%w(/web).each do |dir|
  directory dir do
    action :create
    owner "root"
    group node[:user][:group]
    mode "775"
  end
end

%w(/var/log/nginx/vh /var/cache/nginx).each do |dir|
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
