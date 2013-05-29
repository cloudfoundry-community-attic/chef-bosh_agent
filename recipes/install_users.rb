group node.bosh_user.username

user node.bosh_user.username do
  group node.bosh_user.username
  home "/home/#{node.bosh_user.username}"
  system true
  shell "/bin/bash"
  supports({ manage_home: true })
end

node.bosh_user.groups.split(",").each do |grp|
  group grp do
    members ['root']
  end
end

# echo \"vcap:${bosh_users_password}\" | chpasswd
# echo \"root:${bosh_users_password}\" | chpasswd

execute "set root password" do
  command "echo \"root:#{node.bosh_user.password}\" | chpasswd"
  action :run
end

execute "set node.bosh_user.username password" do
  command "echo \"#{node.bosh_user.username}:#{node.bosh_user.password}\" | chpasswd"
  action :run
end

execute "add #{node.bosh_user.username} user to groups" do
  command "usermod -a -G #{node.bosh_user.groups} #{node.bosh_user.username}"
  user "root"
  action :run
end

execute "add vagrant user to #{node.bosh_user.username}" do
  command "usermod -a -G #{node.bosh_user.username} vagrant"
  user "root"
  action :run
  only_if { ::File.directory?("/home/vagrant") }
end
