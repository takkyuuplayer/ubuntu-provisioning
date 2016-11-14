package 'samba' do
  action :install
end

service 'smbd' do
  action [:enable, :start]
end

template '/etc/samba/smb.conf' do
  source "templates/smb.conf.erb"
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[smbd]'
end

execute 'prepare smbpasswd' do
  command <<-COMMAND
smbpasswd -a ubuntu<<EOF
ubuntu
ubuntu
EOF
  COMMAND
end


