execute 'apt-add-repository ppa:git-core/ppa' do
  command <<-CMD
    apt-add-repository ppa:git-core/ppa -y &&
    apt-get update -y
  CMD
  not_if 'dpkg -l | grep git'
end

%w(
git
).each do |pkg|
  package pkg do
    action :install
  end
end


