file '/etc/ssh/sshd_config' do
  action :edit
  block do |content|
    content.gsub!('#PasswordAuthentication yes', 'PasswordAuthentication no')
  end
  notifies :restart, "service[ssh]"
end

service 'ssh'
