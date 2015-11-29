package 'tor' do
  action :install
end

service 'tor' do
  action [:enable, :start]
end


