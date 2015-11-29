%w(
  binutils
  ghex
  ltrace
  nikto
  radare2
  strace
).each do |pkg|
  package pkg do
    action :install
  end
end
