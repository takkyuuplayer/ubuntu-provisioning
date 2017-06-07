%w(
awscli
).each do |mod|
  execute "Install #{mod}" do
    user "root"
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      pip install #{mod}
    CMD
    not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      pip list --format=columns | grep "^#{mod}"
    CMD
  end
end

