#include_recipe "anyenv::system"

file "/usr/local/etc/anyenvrc" do
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
source "/usr/local/etc/anyenvrc"
EOF
end
