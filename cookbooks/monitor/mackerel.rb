execute 'dpkg mackerel' do
  cwd '/tmp'
  command <<-CMD
wget https://mackerel.io/file/agent/deb/mackerel-agent_latest.all.deb
dpkg -i mackerel-agent_latest.all.deb
apt-get update
  CMD
  not_if 'dpkg -l | grep mackerel'
end

if node[:monitor][:mackerel][:apikey] then
  execute '/etc/mackerel-agent/mackerel-agent.conf' do
    command "/usr/bin/mackerel-agent init -apikey='#{node[:monitor][:mackerel][:apikey]}'"
    not_if 'test -f /etc/mackerel-agent/mackerel-agent.conf'
  end
end

service 'mackerel-agent' do
  action [:enable, :start]
  only_if 'test -f /etc/mackerel-agent/mackerel-agent.conf'
end
