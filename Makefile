all: setup

setup:
	bundle install
	git submodule update --init

sakura:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/sakura.json ./roles/common.rb ./roles/sakura.rb
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./submodules/credentials/nodes/log_rotation.json ./cookbooks/nginx/log_rotation.rb

vagrant:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant.json ./roles/common.rb ./roles/vagrant.rb

vagrant-nginx:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/nginx.json ./roles/web.rb

vagrant-homepage:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant-homepage.json ./roles/web.rb
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./submodules/credentials/nodes/log_rotation.json ./cookbooks/nginx/log_rotation.rb

help:
	cat Makefile
