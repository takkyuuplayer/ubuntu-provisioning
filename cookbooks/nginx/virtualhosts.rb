node[:nginx][:virtual_hosts].each do |conf|
  directory "/web/#{conf[:fqdn]}" do
      action :create
      owner "root"
      group node[:user][:group]
      mode "775"
  end

  execute "Issue certification for #{conf[:fqdn]}" do
    command <<-CMD
      rm /etc/nginx/sites-enabled/#{conf[:fqdn]}.vh
      service nginx restart
      letsencrypt certonly --standalone -d #{conf[:fqdn]} -m #{node[:letsencrypt][:email]} --agree-tos --keep-until-expiring
      chmod -R a+r /etc/letsencrypt/live/#{conf[:fqdn]}
    CMD
    notifies :restart, 'service[nginx]'
    only_if "which letsencrypt"
  end

  template "/etc/nginx/sites-available/#{conf[:fqdn]}.vh" do
    source "templates/#{conf[:template]}.vh.erb"
    mode "644"
    owner 'root'
    group 'root'
    action :create
    notifies :restart, 'service[nginx]'
    variables({
      :app_name => conf[:app_name],
      :fqdn     => conf[:fqdn],
      :port     => conf[:port],
      :ssl      => conf[:ssl],
    })
  end

  link "/etc/nginx/sites-enabled/#{conf[:fqdn]}.vh" do
    action :create
    notifies :restart, 'service[nginx]'
    to "/etc/nginx/sites-available/#{conf[:fqdn]}.vh"
  end
end
