execute 'Install certbot-auto' do
  cwd '/tmp'
  command <<-CMD
    wget https://dl.eff.org/certbot-auto &&
    chmod a+x certbot-auto &&
    mv certbot-auto /usr/local/bin/certbot-auto
  CMD
  not_if 'which certbot-auto'
end

