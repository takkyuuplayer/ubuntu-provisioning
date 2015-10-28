%w(
php5
).each do |pkg|
  `apt-get -s build-dep #{pkg} | grep "Inst" | awk '{print $2}'`.each_line do |dep|
    package dep.chomp do
      action :install
    end
  end
end

