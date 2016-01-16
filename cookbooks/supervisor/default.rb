package "supervisor"

template "/etc/supervisor/conf.d/#{node[:supervisor][:app_name]}.conf" do
  owner "root"
  group "root"
  action :create
  mode "0644"
  source './templates/etc/supervisor/app.conf.erb'
  variables(
    user:     node[:user][:name],
    app_name: node[:supervisor][:app_name],
    command:  node[:supervisor][:command],
    directory: node[:supervisor][:directory],
  )
  notifies :restart, 'service[supervisor]'
end

service 'supervisor' do
    action [:enable, :start]
end
