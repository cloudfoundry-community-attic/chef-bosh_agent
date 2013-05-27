group node.bosh_user.username

user node.bosh_user.username do
  group node.bosh_user.username
  home "/home/#{node.bosh_user.username}"
  system true
  shell "/bin/bash"
  supports({ manage_home: true })
end

