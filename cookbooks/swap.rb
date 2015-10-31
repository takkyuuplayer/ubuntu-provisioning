execute 'swap' do
  command <<-COMMAND
    fallocate -l 4G /swapfile;
    chomod 600 /swapfile;
    mkswap /swapfile;
    swapon /swapfileo;
    echo '/swapfile none swap defaults 0 0' >> /etc/fstab
  COMMAND
  not_if 'grep -q "swapfile" /etc/fstab'
end

