directory File.dirname(node[:nginx][:ssl][:key]) do
  action :create
  mode   "0700"
end

remote_file node[:nginx][:ssl][:key] do
  source "files/server.key"
  action :create
end

directory File.dirname(node[:nginx][:ssl][:crt]) do
  action :create
  mode   "0700"
end

remote_file node[:nginx][:ssl][:crt] do
  source "files/server.crt"
  action :create
end
