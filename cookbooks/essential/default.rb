%w(
curl
emacs
git git-core
locales
sqlite3
tmux
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
