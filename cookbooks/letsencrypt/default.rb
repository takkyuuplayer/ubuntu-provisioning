package 'letsencrypt' do
  action :remove
end

http_request "/usr/local/bin/certbot-auto" do
  url "https://dl.eff.org/certbot-auto"
  mode '775'
end

file "/etc/cron.d/renew-letsencrypt-certification" do
  owner 'root'
  group 'root'
  mode  '644'
  content <<-CRONTAB
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/

15 3,15 * * * /usr/local/bin/certbot-auto renew -n --max-log-backups 0 && nginx -s reload
CRONTAB
end
