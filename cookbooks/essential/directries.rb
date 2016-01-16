%w(/workspace).each do |dir|
  directory dir do
    action :create
    owner "vagrant"
    group "vagrant"
    mode '0775'
  end
end

