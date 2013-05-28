
directory "/var/vcap/bosh/log" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

directory "/var/vcap/bosh/bin" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

cookbook_file "/var/vcap/bosh/bin/ntpdate" do
  source "ntpdate"
  owner "root"
  group "root"
  mode "0755"
end

# 0,15,30,45 * * * * ${bosh_app_dir}/bosh/bin/ntpdate
cron "ntpdate" do
  minute "*/15"
  user "root"
  command "/var/vcap/bosh/bin/ntpdate"
end
