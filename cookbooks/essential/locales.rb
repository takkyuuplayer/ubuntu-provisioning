%w(
locales
).each do |pkg|
  package pkg
end

%w(
  en_US en_US.utf8
  ja_JP.utf8
).each do |locale|
  execute "locale-gen #{locale}" do
    command "locale-gen #{locale}"
    not_if "locale -a | grep #{locale}$"
  end
end
