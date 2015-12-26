require 'itamae'
require 'itamae/resource/package'

include_recipe 'swap.rb'

%w(/workspace).each do |dir|
  directory dir do
    action :create
    owner "vagrant"
    group "vagrant"
    mode '0775'
  end
end

execute 'apt-get-upgrade' do
  action :nothing
  command 'apt-get upgrade -y'
end

execute 'apt-get update' do
  command 'apt-get update -y'
end

%w(
autoconf
bison
build-essential
curl
git git-core
libbz2-dev
libcurl4-openssl-dev
libffi6 libffi6-dbg libffi-dev
libgmp-dev
libjpeg-dev
libltdl-dev
libmcrypt-dev
libpng-dev
libpspell-dev
libreadline-dev
libssl-dev
libt1-dev
libtidy-dev
libxslt1.1 libxslt1-dev
libxml2 libxml2-dbg libxml2-dev
locales
mysql-server-5.6 mysql-client-5.6
openssl
php5 php5-cli php5-dev
re2c
sqlite3
tmux
vim
whois
zip
zsh
).each do |pkg|
  package pkg do
    action :install
  end
end

#%w(
#php5
#).each do |pkg|
#  run_command("apt-get -s build-dep #{pkg} | grep 'Inst' | awk '{print $2}'").stdout.each_line do |dep|
#    package dep.chomp do
#      action :install
#    end
#  end
#end
