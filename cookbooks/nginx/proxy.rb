include_recipe 'default.rb';

%w(/web).each do |dir|
  directory "#{dir}/#{node["proxy"][:subdomain]}" do
    action :create
    owner "vagrant"
    group "vagrant"
    mode "775"
  end
end

template "/etc/nginx/sites-available/#{node[:proxy][:subdomain]}-proxy.vh" do
  source "templates/proxy.vh.erb"
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[nginx]'
  variables({
    :subdomain => node[:proxy][:subdomain],
    :port      => node[:proxy][:port],
  })
end

link "/etc/nginx/sites-enabled/#{node[:proxy][:subdomain]}-proxy.vh" do
  action :create
  to "/etc/nginx/sites-available/#{node[:proxy][:subdomain]}-proxy.vh"
end
