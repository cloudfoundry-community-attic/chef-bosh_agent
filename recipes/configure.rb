include_recipe "bosh_agent::configure_local"

# /etc/infrastructure required for /etc/sv/agent/run to pass to bosh_agent
template "/etc/infrastructure" do
  source "etc/infrastructure.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    system_parameters_infrastructure: node.bosh_agent.infrastructure
  })
end
