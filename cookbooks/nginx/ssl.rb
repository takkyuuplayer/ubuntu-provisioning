template "#{node[:nginx][:ssl][:ssl_certificate]}" do
  source "templates/server.crt"
  action :create
end

template "#{node[:nginx][:ssl][:ssl_certificate_key]}" do
  source "templates/server.key"
  action :create
end
