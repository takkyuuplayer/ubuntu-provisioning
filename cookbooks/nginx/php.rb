package 'php7.0-fpm' do
  action :install
end

service 'php7.0-fpm' do
  action [:enable, :start]
end
