#!/usr/bin/ruby
# -*- coding:utf-8 -*-

%w(
mysql-server-5.6 mysql-client-5.6
).each do |pkg|
  package pkg do
    action :install
  end
end
