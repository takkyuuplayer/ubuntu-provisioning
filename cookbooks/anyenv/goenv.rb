execute "Install ghq" do
  user node[:user][:name]
  command <<-CMD
    . #{node[:anyenv][:anyenvrc_file]};
    go get github.com/motemen/ghq
  CMD
  not_if <<-CMD
    test -f $HOME/go/bin/ghq
  CMD
end

%w(
github.com/golang/lint/golint
github.com/jstemmer/gotags
github.com/motemen/gore
github.com/nsf/gocode
github.com/rogpeppe/godef
golang.org/x/tools/cmd/...
).each do |mod|
  execute "Install #{mod}" do
    user node[:user][:name]
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      go get #{mod}
      CMD
      not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      ghq list | grep #{mod}
      CMD
  end
end

%w(
golang/go
).each do |mod|
  execute "Install #{mod}" do
    user node[:user][:name]
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      $HOME/go/bin/ghq get #{mod}
      CMD
      not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      $HOME/go/bin/ghq list | grep #{mod}
      CMD
  end
end
