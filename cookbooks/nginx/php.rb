include_recipe 'default.rb';

package 'php5-fpm' do
  action :install
end

service 'php5-fpm' do
  action [:enable, :start]
end

%w(/web).each do |dir|
  directory "#{dir}/#{node["php"][:subdomain]}" do
    action :create
    owner "vagrant"
    group "vagrant"
    mode "775"
  end
end

template "/etc/nginx/sites-available/#{node[:php][:subdomain]}-php.vh" do
  source "templates/php.vh.erb"
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[nginx]'
  variables({
    :subdomain => node[:php][:subdomain],
  })
end

link "/etc/nginx/sites-enabled/#{node[:php][:subdomain]}-php.vh" do
  action :create
  to "/etc/nginx/sites-available/#{node[:php][:subdomain]}-php.vh"
end
