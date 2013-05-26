
# install agent from gem (or source)
# - PATH=/var/vcap/bosh/bin
# - add source
# - install bosh_agent

bosh_dir = "/var/vcap/bosh"
agent_gem_src_url = "https://s3.amazonaws.com/bosh-jenkins-gems/"

execute "install bosh_agent rubygem" do
  command "gem install bosh_agent --no-rdoc --no-ri -r --pre --source #{agent_gem_src_url}"
  environment({
    "PATH" => "#{File.join(bosh_dir, "bin")}:#{ENV['PATH']}"
  })
  action :run
end


# /etc/sv/agent links to /etc/service/agent
# /var/vcap/bosh/state.yml
# log rotation