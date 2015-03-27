#
# Cookbook Name:: webapp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx::default"

%w(/web).each do |dir|
  directory dir do
    action :create
    user "vagrant"
    group "vagrant"
    mode 0775
  end
end

%w(/var/log/nginx/vh /var/cache/nginx).each do |dir|
  directory dir do
    action :create
    user "nginx"
    group "nginx"
    mode 0775
  end
end


directory "/var/cache/nginx" do
  action :create
  user "nginx"
  group "nginx"
  mode 0775
end
directory "/var/cache/nginx" do
  action :create
  user "nginx"
  group "nginx"
  mode 0775
end
