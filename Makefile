all: setup

setup:
	bundle install

sakura:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/sakura.json ./roles/common.rb ./roles/sakura.rb

vagrant:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant.json ./roles/common.rb ./roles/vagrant.rb

vagrant-nginx:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/nginx.json ./roles/web.rb

vagrant-homepage:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant-homepage.json ./roles/web.rb

vagrant-docker:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant.json ./cookbooks/docker/default.rb

help:
	cat Makefile
