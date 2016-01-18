%w(
locales
).each do |pkg|
  package pkg
end

execute 'locale' do
  command <<-COMMAND
    locale-gen en_US en_US.UTF-8 ja_JP.UTF-8
  COMMAND
end
