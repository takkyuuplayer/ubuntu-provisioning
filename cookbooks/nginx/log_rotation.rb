file "/etc/logrotate.d/nginx" do
  action :delete
end

template '/etc/nginx/logrotate.conf' do
  mode "644"
  owner 'root'
  group 'root'
  action :create
end

if node[:nginx].has_key?(:log_archive) then
  remote_directory '/root/.aws' do
    action :create
    mode "700"
    owner "root"
    group "root"
    source "../../submodules/credentials/files/root/.aws"
  end

  template "/usr/local/sbin/nginx-archive-log.sh" do
    mode "544"
    owner 'root'
    group 'root'
    action :create
    variables({
      :aws_profile => node[:nginx][:log_archive][:aws_profile],
      :s3_bucket => node[:nginx][:log_archive][:s3_bucket],
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
0 0 * * * root /usr/sbin/logrotate /etc/nginx/logrotate.conf > /dev/null
30 1 * * * root $SHELL -l /usr/local/sbin/nginx-archive-log.sh > /dev/null
CRONTAB
  end
end

