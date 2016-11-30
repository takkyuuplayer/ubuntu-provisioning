include_recipe 'default.rb';

directory "/web/#{node["proxy"][:app_name]}" do
    action :create
    owner "root"
    group node[:user][:group]
    mode "775"
end

link "/etc/nginx/sites-enabled/#{node[:proxy][:app_name]}-proxy.vh" do
  action :create
  to "/etc/nginx/sites-available/#{node[:proxy][:app_name]}-proxy.vh"
end

template "/etc/nginx/sites-available/#{node[:proxy][:app_name]}-proxy.vh" do
  ssl = node[:proxy][:ssl] \
    && File.exists?(node[:proxy][:ssl][:ssl_certificate]) \
    && File.exists?(node[:proxy][:ssl][:ssl_certificate_key]) \
    ? node[:proxy][:ssl] : nil

  source "templates/proxy.vh.erb"
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[nginx]'
  puts ssl
  variables({
    :app_name => node[:proxy][:app_name],
    :fqdn     => node[:proxy][:fqdn],
    :port     => node[:proxy][:port],
    :ssl      => ssl,
  })
end
