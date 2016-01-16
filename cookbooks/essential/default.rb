%w(
curl
emacs
git git-core
locales
sqlite3
tmux
vim
whois
zip
zsh
).each do |pkg|
  package pkg do
    action :install
  end
end
