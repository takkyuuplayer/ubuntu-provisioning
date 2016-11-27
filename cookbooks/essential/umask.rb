file "/etc/profile.d/umask.sh" do
  owner "root"
  group "root"
  action :create
  mode "0644"
  content <<EOF
umask 0002
EOF
end

