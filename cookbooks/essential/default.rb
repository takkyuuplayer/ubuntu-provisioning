%w(
ack-grep
apache2-utils
curl
htop
jq
locales
sqlite3
tree
vim
wget
whois
zip
zsh
).each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe "./fzf.rb"
include_recipe "./git.rb"
