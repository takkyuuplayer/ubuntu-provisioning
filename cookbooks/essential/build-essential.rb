%w(
autoconf
bison
build-essential
dialog
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
libxml2 libxml2-dbg libxml2-dev libxml2-utils
libxslt1.1 libxslt1-dev
openssl
python-dev python-pip python3-dev python3-pip python-virtualenv
re2c
software-properties-common
).each do |pkg|
  package pkg do
    action :install
  end
end
