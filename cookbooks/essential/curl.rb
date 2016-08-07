git '/tmp/curl' do
  repository 'https://github.com/curl/curl.git'
  not_if 'test -f /usr/local/bin/curl'
end

execute 'Install curl' do
  cwd "/tmp/curl"
  command <<-CMD
    apt-get build-dep curl -y &&
    ./buildconf &&
    ./configure --with-nghttp2=/usr/local --with-ssl &&
    make &&
    make install
  CMD
  not_if 'test -f /usr/local/bin/curl'
end
