include_recipe "../cookbooks/essential/apt.rb"
include_recipe "../cookbooks/essential/swap.rb"
include_recipe "../cookbooks/essential/default.rb"
include_recipe "../cookbooks/essential/build-essential.rb"

include_recipe "../cookbooks/security/ssh.rb"

include_recipe "../cookbooks/anyenv/default.rb"
include_recipe "../cookbooks/anyenv/rbenv.rb"
