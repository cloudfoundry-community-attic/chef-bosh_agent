package "sysstat"

cookbook_file "/etc/default/sysstat" do
  source "sysstat"
  owner "root"
  group "root"
  mode "0644"
end