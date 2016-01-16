include_recipe "anyenv::system"

file "/usr/local/etc/anyenvrc" do
  action :create
  owner "root"
  group "root"
  mode  "0644"
  content <<EOF
export ANYENV_ROOT="#{node["anyenv"]["anyenv_root"]}"
export PATH="<%= @install_dir %>/bin:$PATH"
eval "$(anyenv init -)"
EOF
end
