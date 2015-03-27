include_recipe 'nginx'
include_recipe 'php-fpm'

%w(php-fpm nginx).each do |serv|
    service serv do
        supports :status => true, :restart => true, :reload => true
        action :start
    end
end

%w(/web).each do |dir|
  directory "#{dir}/#{node["sandbox"][:subdomain]}" do
    action :create
    user "vagrant"
    group "vagrant"
    mode 0775
  end
end

template "/etc/nginx/sites-available/#{node[:sandbox][:subdomain]}-local.vh" do
  source "sandbox-local.vh.erb"
  mode 00644
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[nginx]'
  variables({
    :subdomain => node[:sandbox][:subdomain],
  })
end

link "/etc/nginx/sites-enabled/#{node[:sandbox][:subdomain]}-local.vh" do
  owner 'root'
  group 'root'
  action :create
  to "/etc/nginx/sites-available/#{node[:sandbox][:subdomain]}-local.vh"
end
