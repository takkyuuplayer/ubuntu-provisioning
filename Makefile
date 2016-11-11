all: setup

setup:
	bundle install

vagrant:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant.json ./roles/common.rb ./roles/vagrant.rb

vagrant-web:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant.json ./roles/web.rb

help:
	cat Makefile
