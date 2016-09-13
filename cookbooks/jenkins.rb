execute 'apt-key add' do
  command <<-CMD
    wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add - ;
    echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list;
    apt-get update -y
  CMD
  not_if 'test -f /etc/apt/sources.list.d/jenkins.list'
end

%w(
jenkins
).each do |pkg|
  package pkg do
    action :install
  end
end
