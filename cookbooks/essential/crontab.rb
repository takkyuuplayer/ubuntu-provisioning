execute 'crontab: letsencrypt renew --agree-tos' do
  command <<-CMD
  echo "MAILTO=#{node[:crontab][:email]}" > /tmp/crontab
  crontab /tmp/crontab
  rm /tmp/crontab
  CMD
  not_if 'crontab -l | grep "MAIL_TO"'
end
