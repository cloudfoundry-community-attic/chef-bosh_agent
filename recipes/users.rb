group node.bosh_agent.username

user node.bosh_agent.username do
  group node.bosh_agent.username
  home "/home/#{node.bosh_agent.username}"
  system true
  shell "/bin/bash"
  supports({ manage_home: true })
end

