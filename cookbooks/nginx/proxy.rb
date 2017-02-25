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

execute "Issue certification for #{node[:proxy][:fqdn]}" do
  command <<-CMD
letsencrypt certonly --webroot -w /web/#{node[:proxy][:app_name]}/public -d #{node[:proxy][:fqdn]} -m #{node[:letsencrypt][:email]} --agree-tos --keep-until-expiring
chmod -R a+r /etc/letsencrypt/live/#{node[:proxy][:fqdn]}
  CMD
  notifies :restart, 'service[nginx]'
  only_if "which letsencrypt"
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
    :ssl      => node[:proxy][:ssl],
  })
end

