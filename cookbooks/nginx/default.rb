package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end

%w(/web).each do |dir|
  directory dir do
    action :create
    owner "vagrant"
    group "vagrant"
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
