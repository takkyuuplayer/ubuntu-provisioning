#include_recipe 'selinux::disabled'
include_recipe "../cookbooks/nginx/default.rb"
include_recipe "../cookbooks/nginx/ssl.rb"
#include_recipe "../cookbooks/nginx/php.rb"
include_recipe "../cookbooks/nginx/virtualhosts.rb"
