execute 'Install fzf' do
  cwd "/tmp/"
  command <<-CMD
     wget https://github.com/junegunn/fzf-bin/releases/download/#{node[:fzf][:version]}/fzf-#{node[:fzf][:version]}-linux_amd64.tgz &&
     tar zxvf ./fzf-#{node[:fzf][:version]}-linux_amd64.tgz &&
     mv fzf /usr/local/bin/fzf &&
     rm ./fzf-#{node[:fzf][:version]}-linux_amd64.tgz
  CMD
  not_if "which fzf && fzf --version | grep #{node[:fzf][:version]}"
end
