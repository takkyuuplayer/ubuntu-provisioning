#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(/workspace).each do |dir|
  directory dir do
    action :create
    user "vagrant"
    group "vagrant"
    mode 0775
  end
end

%w(
bison
libffi6 libffi6-dbg libffi-dev
libreadline-dev
libssl-dev
libxml2 libxml2-dbg libxml2-dev
openssl
re2c
).each do |pkg|
  package pkg do
    action :upgrade
  end
end
