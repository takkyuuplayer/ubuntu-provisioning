%w(
apache2
).each do |pkg|
  package pkg do
    action :install
  end
end

file "/etc/apache2/ports.conf" do
  action :edit
  block do |content|
    content.gsub!("Listen 80", "Listen 10080")
    content.gsub!("Listen 443", "Listen 10443")
  end
  notifies :restart, 'service[apache2]'
end

service 'apache2' do
  action [:enable, :start]
end
