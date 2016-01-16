%w(/workspace).each do |dir|
  directory dir do
    action :create
    owner node[:user][:nane]
    group node[:user][:group]
    mode '0775'
  end
end

