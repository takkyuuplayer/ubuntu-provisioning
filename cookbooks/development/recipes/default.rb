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
libmcrypt-dev
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

%w(
php5
).each do |pkg|
  `apt-get -s build-dep #{pkg} | grep "Inst" | awk '{print $2}'`.each_line do |dep|
    package dep.chomp do
      action :install
    end
  end
end
