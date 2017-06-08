group node[:user][:group] do
    gid 500
    action :create
end

user node[:user][:name] do
    gid   500
    action :create
end

if node[:user].has?(:linger) then
  if node[:user][:linger] then
    execute "loginctl enable-linger #{node[:user][:name]}" do
      not_if "loginctl show-user #{node[:user][:name]} | grep -i 'Linger=yes'"
    end
  else
    execute "loginctl disable-linger #{node[:user][:name]}" do
      not_if "loginctl show-user #{node[:user][:name]} | grep -i 'Linger=no'"
    end
  end
end
