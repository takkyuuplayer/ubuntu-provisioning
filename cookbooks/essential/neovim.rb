execute 'add-apt-repository ppa:neovim-ppa/unstable' do
  command <<-CMD
    add-apt-repository ppa:neovim-ppa/unstable -y &&
    apt-get update -y
  CMD
  not_if 'dpkg -l | grep neovim'
end

%w(
neovim
).each do |pkg|
  package pkg do
    action :install
  end
end

