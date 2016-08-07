all: setup

setup:
	bundle install

vagrant:
	sudo itamae local ./roles/common.rb ./roles/vagrant.rb -j ./nodes/vagrant.json
