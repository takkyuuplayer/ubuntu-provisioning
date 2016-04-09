%w(
bundler
).each do |mod|
  execute "Install #{mod}" do
    user "root"
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      gem install #{mod}
    CMD
    not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      gem contents #{mod}
    CMD
  end
end
