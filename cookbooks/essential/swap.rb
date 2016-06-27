execute 'swap' do
  command <<-COMMAND
    fallocate -l 4G /swapfile &&
    chmod 600 /swapfile &&
    mkswap /swapfile &&
    swapon /swapfile &&
    echo '/swapfile none swap defaults 0 0' >> /etc/fstab
  COMMAND
  not_if 'test -f /swapfile'
end
