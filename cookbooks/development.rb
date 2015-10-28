require 'itamae'
require 'itamae/resource/package'

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
bison
build-essential
curl
git
libffi6 libffi6-dbg libffi-dev
libmcrypt-dev
libreadline-dev
libssl-dev
libxml2 libxml2-dbg libxml2-dev
openssl
php5 php5-cli
re2c
sqlite3
tmux
vim
whois
zsh
).each do |pkg|
  package pkg do
    action :install
  end
end
