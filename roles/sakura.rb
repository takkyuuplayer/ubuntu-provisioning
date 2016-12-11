include_recipe "../cookbooks/security/ssh.rb"

include_recipe "../cookbooks/anyenv/default.rb"
include_recipe "../cookbooks/anyenv/rbenv.rb"

include_recipe "../cookbooks/nginx/default.rb"
include_recipe "../cookbooks/nginx/proxy.rb"

include_recipe "../cookbooks/monitor/mackerel.rb"
