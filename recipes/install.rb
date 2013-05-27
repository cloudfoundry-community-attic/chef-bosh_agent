package "runit"

execute "install bosh_agent rubygem" do
  command "gem install bosh_agent --conservative --no-rdoc --no-ri -r --pre --source #{node.bosh_agent.gem_src_url}"
  environment({
    "PATH" => "#{node.bosh_bin_dir}:#{ENV['PATH']}"
  })
  action :run
end

directory "/etc/sv/agent/log" do
  recursive true
  action :create
end

cookbook_file "/etc/sv/agent/run" do
  source "runit/agent/run"
  mode "0755"
end

cookbook_file "/etc/sv/agent/log/run" do
  source "runit/agent/log/run"
  mode "0755"
end

link "/etc/service/agent" do
  to "/etc/sv/agent"
end

cookbook_file "#{node.bosh_dir}/state.yml" do
  source "emptystate.yml"
  mode "0644"
  action :create_if_missing
end

# log rotation