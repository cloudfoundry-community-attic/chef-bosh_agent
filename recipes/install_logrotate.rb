cookbook_file "/etc/cron.hourly/logrotate" do
  source "etc/logrotate"
  owner "root"
  group "root"
  mode "0755"
end

file "/etc/cron.daily/logrotate" do
  action :delete
end