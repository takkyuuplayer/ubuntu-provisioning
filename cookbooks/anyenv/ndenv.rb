%w{
  yarn
}.each do |mod|
  execute "Install #{mod}" do
    user "root"
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      npm install --global #{mod}
    CMD
    not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      npm ls -g | grep " #{mod}@"
    CMD
  end
end

