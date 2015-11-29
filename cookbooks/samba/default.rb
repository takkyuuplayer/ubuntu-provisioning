package 'samba' do
  action :install
end

service 'samba' do
  action [:enable, :start]
end

template '/etc/samba/smb.conf' do
  source "templates/smb.conf.erb"
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[samba]'
end

execute 'prepare smbpasswd' do
  command <<-COMMAND
smbpasswd -a vagrant<<EOF
vagrant
vagrant
EOF
  COMMAND
end


