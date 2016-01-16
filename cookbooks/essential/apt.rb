execute 'apt-get-upgrade' do
  action :nothing
  command 'apt-get upgrade -y'
end

execute 'apt-get update' do
  command 'apt-get update -y'
end
