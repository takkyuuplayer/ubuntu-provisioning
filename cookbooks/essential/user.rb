group node[:user][:group] do
    gid 500
    action :create
end

user node[:user][:name] do
    gid   500
    action :create
end
