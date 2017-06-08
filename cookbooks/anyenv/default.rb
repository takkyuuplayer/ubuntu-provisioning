git node['anyenv']['anyenv_root'] do
  repository 'https://github.com/riywo/anyenv'
end

git "#{node['anyenv']['anyenv_root']}/plugins/anyenv-update" do
  repository 'https://github.com/znz/anyenv-update'
end

git "#{node['anyenv']['anyenv_root']}/plugins/anyenv-git" do
  repository 'https://github.com/znz/anyenv-git'
end

file node['anyenv']['anyenvrc_file'] do
  owner "root"
  group "root"
  action :create
  mode  "0644"
  content <<EOF
export ANYENV_ROOT="#{node["anyenv"]["anyenv_root"]}"
export PATH="${ANYENV_ROOT}/bin:$PATH"
eval "$(anyenv init -)"
EOF
end

file "/etc/profile.d/anyenv.sh" do
  owner "root"
  group "root"
  action :create
  mode "0644"
  content <<EOF
source "#{node[:anyenv][:anyenvrc_file]}"
EOF
end

node['anyenv']['install_versions'].each do |env, versions|

  execute "anyenv install #{env}" do
    user "root"
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      anyenv install #{env}
    CMD
    not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      which #{env}
    CMD
  end

  versions.each do |version|
    execute "#{env} install #{version}" do
      user "root"
      command <<-CMD
        . #{node[:anyenv][:anyenvrc_file]};
        #{env} install #{version}
      CMD
      not_if <<-CMD
        . #{node[:anyenv][:anyenvrc_file]};
        #{env} versions | grep ' #{version}'
      CMD
    end
  end

  execute "#{env} global #{versions.first}" do
    user "root"
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      #{env} global #{versions.first}
    CMD
    not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      #{env} versions | grep '* #{versions.first}'
    CMD
  end

  if File.exist?("./cookbooks/anyenv/#{env}.rb") then
    include_recipe "./#{env}.rb"
  end
end
