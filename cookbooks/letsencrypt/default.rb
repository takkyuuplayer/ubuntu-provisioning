package 'letsencrypt' do
  action :install
end

execute 'crontab: letsencrypt renew --agree-tos' do
  command <<-CMD
  crontab -l > /tmp/crontab
  echo "15 3,15 * * * /usr/bin/letsencrypt renew -n --agree-tos" >> /tmp/crontab
  crontab /tmp/crontab
  rm /tmp/crontab
  CMD
  not_if 'crontab -l | grep "letsencrypt renew"'
end
