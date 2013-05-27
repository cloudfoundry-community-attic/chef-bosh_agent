# Firstboot script
cookbook_file "/etc/rc.local" do
  source "etc/rc.local"
end

cookbook_file "/root/firstboot.sh" do
  source "root/firstboot.sh"
  mode "0755"
end

