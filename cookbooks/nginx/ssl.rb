directory File.dirname(node[:nginx][:ssl][:key_path]) do
  action :create
  mode   "0700"
end

remote_file node[:nginx][:ssl][:key_path] do
  source "files/server.key"
  action :create
end

directory File.dirname(node[:nginx][:ssl][:crt_path]) do
  action :create
  mode   "0700"
end

remote_file node[:nginx][:ssl][:crt_path] do
  source "files/server.crt"
  action :create
end
