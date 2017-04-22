%w(
apt-transport-https
ca-certificates
curl
software-properties-common
).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'apt-key add' do
  command <<-CMD
    wget -q -O - https://download.docker.com/linux/ubuntu/gpg | apt-key add - ;
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list;
    apt-get update -y
  CMD
  not_if 'test -f /etc/apt/sources.list.d/docker.list'
end

package 'docker-ce' do
  action :install
end

service 'docker' do
  action [:enable, :start]
end

execute "sudo usermod -aG docker #{node[:user][:name]}" do
  command "sudo usermod -aG docker #{node[:user][:name]}"
  not_if "groups #{node[:user][:name]} | grep docker"
end
