package 'letsencrypt' do
  action :install
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

15 3,15 * * * /usr/bin/letsencrypt renew -n --agree-tos
CRONTAB
end
