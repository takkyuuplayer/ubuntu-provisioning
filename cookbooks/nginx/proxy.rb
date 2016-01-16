include_recipe 'default.rb';

directory "/web/#{node["proxy"][:app_name]}" do
    action :create
    owner "root"
    group node[:user][:group]
    mode "775"
end

template "/etc/nginx/sites-available/#{node[:proxy][:app_name]}-proxy.vh" do
  source "templates/proxy.vh.erb"
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[nginx]'
  variables({
    :app_name => node[:proxy][:app_name],
    :fqdn     => node[:proxy][:fqdn],
    :port     => node[:proxy][:port],
  })
end

link "/etc/nginx/sites-enabled/#{node[:proxy][:app_name]}-proxy.vh" do
  action :create
  to "/etc/nginx/sites-available/#{node[:proxy][:app_name]}-proxy.vh"
end
