git '/tmp/ctags' do
  repository 'https://github.com/universal-ctags/ctags.git'
  not_if 'test -f /tmp/ctags'
end

execute 'Install universal-ctags' do
  cwd "/tmp/ctags"
  command <<-CMD
    ./autogen.sh
    ./configure
    make
    make install
  CMD
  not_if 'test -f /usr/local/bin/ctags'
end

