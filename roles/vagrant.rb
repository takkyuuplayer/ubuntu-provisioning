include_recipe "../cookbooks/essential/swap.rb"
include_recipe "../cookbooks/essential/ntp.rb"

include_recipe "../cookbooks/anyenv/default.rb"
include_recipe "../cookbooks/samba/default.rb"

include_recipe '../cookbooks/mysql.rb'
