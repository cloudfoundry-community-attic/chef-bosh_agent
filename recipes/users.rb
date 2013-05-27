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
