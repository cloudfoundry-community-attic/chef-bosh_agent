execute "restart bosh_agent" do
  command "sudo -S sv restart agent"
  user "root"
  action :run
end
