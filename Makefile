all: setup

setup:
	bundle install

vagrant:
	sudo env "PATH=$$PATH" bundle exec -- itamae local ./roles/common.rb ./roles/vagrant.rb -j ./nodes/vagrant.json

vagrant-web:
	sudo env "PATH=$$PATH" bundle exec -- itamae local ./roles/web.rb -j ./nodes/vagrant.json

help:
	cat Makefile
