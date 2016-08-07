git '/tmp/nghttp2' do
  repository 'https://github.com/tatsuhiro-t/nghttp2.git'
  not_if 'which nghttp'
end

execute "Install nghttp2" do
  cwd "/tmp/nghttp2"
  command <<-CMD
    autoreconf -i &&
    automake &&
    autoconf &&
    ./configure &&
    make &&
    make install
  CMD
  not_if 'which nghttp'
end
