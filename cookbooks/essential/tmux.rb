%w(
  libevent-dev
  libncurses5-dev
).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'Install tmux' do
  cwd "/tmp/"
  command <<-CMD
    wget https://github.com/tmux/tmux/releases/download/#{node[:tmux][:version]}/tmux-#{node[:tmux][:version]}.tar.gz &&
    tar zxvf tmux-#{node[:tmux][:version]}.tar.gz &&
    cd /tmp/tmux-#{node[:tmux][:version]} &&
    ./configure &&
    make && make install
  CMD
  not_if "which tmux && tmux -V | grep #{node[:tmux][:version]}"
end
