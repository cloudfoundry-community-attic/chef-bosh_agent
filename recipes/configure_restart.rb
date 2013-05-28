execute "restart bosh_agent" do
  command "killall bosh_agent || echo 'No bosh agent to restart'"
  user "root"
  action :run
end
