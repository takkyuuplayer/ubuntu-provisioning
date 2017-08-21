%w(
ack-grep
apache2-utils
curl
direnv
fish
git
git-core
htop
jq
locales
sqlite3
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
