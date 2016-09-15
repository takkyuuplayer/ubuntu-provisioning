execute 'apt-key add' do
  command <<-CMD
    wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add - ;
    echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list;
    apt-get update -y
  CMD
  not_if 'test -f /etc/apt/sources.list.d/jenkins.list'
end

package 'jenkins' do
  action :install
end

service 'jenkins' do
  action [:enable, :start]
end

template '/etc/default/jenkins' do
  source "templates/jenkins.erb"
  mode "644"
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[jenkins]'
end
