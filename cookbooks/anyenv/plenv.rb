execute "Install CPANM" do
  user "root"
  command <<-CMD
    . #{node[:anyenv][:anyenvrc_file]};
    plenv install-cpanm
  CMD
  not_if <<-CMD
    . #{node[:anyenv][:anyenvrc_file]};
    which cpanm
  CMD
end

%w{
  Carton
  ExtUtils::MakeMaker
  Perl::Tidy
}.each do |mod|
  execute "Install #{mod}" do
    user "root"
    command <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      cpanm #{mod}
    CMD
    not_if <<-CMD
      . #{node[:anyenv][:anyenvrc_file]};
      perldoc -lm #{mod}
    CMD
  end
end
