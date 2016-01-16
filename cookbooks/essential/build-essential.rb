%w(
autoconf
bison
build-essential
libbz2-dev
libcurl4-openssl-dev
libffi6 libffi6-dbg libffi-dev
libgmp-dev
libjpeg-dev
libltdl-dev
libmcrypt-dev
libpng-dev
libpspell-dev
libreadline-dev
libssl-dev
libt1-dev
libtidy-dev
libxslt1.1 libxslt1-dev
libxml2 libxml2-dbg libxml2-dev libxml2-utils
locales
openssl
re2c
).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'locale' do
  command <<-COMMAND
    locale-gen en_US en_US.UTF-8 ja_JP.UTF-8
  COMMAND
end
