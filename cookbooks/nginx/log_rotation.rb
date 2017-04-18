file "/etc/logrotate.d/nginx" do
  action :delete
end

template '/etc/nginx/logrotate.conf' do
  mode "644"
  owner 'root'
  group 'root'
  action :create
end

template "/usr/local/sbin/nginx-archive-log.sh" do
  mode "500"
  owner 'root'
  group 'root'
  action :create
  variables({
    :aws_access_key_id => node[:nginx][:log_rotation][:aws_access_key_id],
    :aws_secret_access_key => node[:nginx][:log_rotation][:aws_secret_access_key],
    :aws_default_region => node[:nginx][:log_rotation][:aws_default_region],
    :log_archive_s3_bucket => node[:nginx][:log_rotation][:s3_bucket],
  })
end

file "/etc/cron.d/nginx-archive-log" do
  owner 'root'
  group 'root'
  mode  '644'
  content <<-CRONTAB
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/

# archive/transfer/remove webserver log file
30 6 * * * root $SHELL -l /usr/local/sbin/archive_log.sh > /dev/null
  CRONTAB
end
