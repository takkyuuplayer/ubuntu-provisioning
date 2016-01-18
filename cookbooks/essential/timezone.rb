link "/etc/localtime" do
  to "/usr/share/zoneinfo/Asia/Tokyo"
  action :create
  force true
end
