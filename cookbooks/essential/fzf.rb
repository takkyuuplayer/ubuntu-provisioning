execute 'Install fzf' do
  cwd "/tmp/"
  command <<-CMD
     wget https://github.com/junegunn/fzf-bin/releases/download/0.16.5/fzf-0.16.5-linux_amd64.tgz &&
     tar zxvf ./fzf-0.16.5-linux_amd64.tgz &&
     mv fzf /usr/local/bin/fzf &&
     rm ./fzf-0.16.5-linux_amd64.tgz
  CMD
  not_if 'test -f /usr/local/bin/fzf'
end


