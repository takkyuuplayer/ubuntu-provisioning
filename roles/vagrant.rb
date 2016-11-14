include_recipe "../cookbooks/anyenv/default.rb"
include_recipe "../cookbooks/anyenv/rbenv.rb"
include_recipe "../cookbooks/anyenv/plenv.rb"
include_recipe "../cookbooks/anyenv/ndenv.rb"

include_recipe "../cookbooks/samba/default.rb"

include_recipe '../cookbooks/mysql.rb'
