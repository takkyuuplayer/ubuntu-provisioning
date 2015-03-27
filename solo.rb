chef_dir File.expand_path(File.dirname(__FILE__))
file_cache_path "#{chef_dir}/cache"
cookbook_path ["#{chef_dir}/cookbooks", "#{chef_dir}/berks-cookbooks"]
role_path "#{chef_dir}/roles"
data_bag_path "#{chef_dir}/data_bags"
log_level :error
