include_recipe "../cookbooks/essential/swap.rb"
include_recipe "../cookbooks/essential/ntp.rb"

include_recipe "../cookbooks/security/ssh.rb"

include_recipe "../cookbooks/anyenv/default.rb"
include_recipe "../cookbooks/anyenv/rbenv.rb"

include_recipe "../cookbooks/letsencrypt/default.rb"
include_recipe "../cookbooks/nginx/default.rb"
include_recipe "../cookbooks/nginx/virtualhosts.rb"
include_recipe "../cookbooks/nginx/log_rotation.rb"

include_recipe "../cookbooks/monitor/mackerel.rb"
