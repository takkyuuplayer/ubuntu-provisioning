#!/usr/bin/ruby
# -*- coding:utf-8 -*-

include_recipe 'nginx'

%w(nginx).each do |serv|
  service serv do
    supports :status => true, :restart => true, :reload => true
    action :start
  end
end

%w(/web).each do |dir|
  directory "#{dir}/#{node["proxy-sandbox"][:subdomain]}" do
    action :create
    user "vagrant"
    group "vagrant"
    mode 0775
  end
end

template "/etc/nginx/sites-available/#{node["proxy-sandbox"][:subdomain]}-local.vh" do
  source "proxy-local.vh.erb"
  mode 00644
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[nginx]'
  variables({
    :subdomain => node["proxy-sandbox"][:subdomain],
    :port      => node["proxy-sandbox"][:port],
  })
end

link "/etc/nginx/sites-enabled/#{node["proxy-sandbox"][:subdomain]}-local.vh" do
  owner 'root'
  group 'root'
  action :create
  to "/etc/nginx/sites-available/#{node["proxy-sandbox"][:subdomain]}-local.vh"
end
