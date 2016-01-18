%w(
  ntp
).each do |pkg|
  package pkg
end

service "ntp" do
  action [:enable, :stop, :start]
end
