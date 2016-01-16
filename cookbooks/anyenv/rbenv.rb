%w(
bundler
).each do |mod|
  execute "Install #{mod}" do
    user "root"
    command <<-CMD
      . "/usr/local/etc/anyenvrc"
      gem install #{mod}
    CMD
    not_if <<-CMD
      . "/usr/local/etc/anyenvrc"
      gem contents #{mod}
    CMD
  end
end
