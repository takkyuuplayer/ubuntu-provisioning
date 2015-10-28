# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
Vagrant.configure(2) do |config|
  config.vm.box      = "opscode/ubuntu-14.04"
  config.vm.box_url  = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"

  config.vm.hostname = "ubuntu-vagrant"
  config.vm.network "private_network", ip: "192.168.33.101"
end
