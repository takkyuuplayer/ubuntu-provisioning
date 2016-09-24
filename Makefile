all: setup

setup:
	bundle install

vagrant:
	sudo env "PATH=$$PATH" bundle exec -- itamae local ./roles/common.rb ./roles/vagrant.rb -j ./nodes/vagrant.json
