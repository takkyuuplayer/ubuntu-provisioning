setup: vendor/bundle submodules

sakura:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/sakura.json ./roles/common.rb ./roles/sakura.rb

vagrant:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant.json ./roles/common.rb ./roles/vagrant.rb

vagrant-nginx:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/nginx.json ./roles/web.rb

vagrant-homepage:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant-homepage.json ./roles/web.rb

circle:
	sudo env "PATH=$$PATH" bundle exec -- itamae local -j ./nodes/vagrant.json ./roles/common.rb ./roles/circle.rb

help:
	cat Makefile

.PHONY: vendor/bundle submodules

vendor/bundle:
	bundle install

submodules:
	@if [ "$(CIRCLE_BUILD_NUM)" ] ; then \
		git submodule update --init; \
	fi;
