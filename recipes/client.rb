execute "install pry rubygem" do
  command "gem install pry --conservative --no-rdoc --no-ri -r"
  environment({
    "PATH" => "#{node.bosh_bin_dir}:#{ENV['PATH']}"
  })
  action :run
end

execute "install bosh agent_client rubygem" do
  command "gem install agent_client --conservative --no-rdoc --no-ri -r --pre --source #{node.bosh_agent.gem_src_url}"
  environment({
    "PATH" => "#{node.bosh_bin_dir}:#{ENV['PATH']}"
  })
  action :run
end

execute "install bosh blobstore_client rubygem" do
  command "gem install blobstore_client --conservative --no-rdoc --no-ri -r --pre --source #{node.bosh_agent.gem_src_url}"
  environment({
    "PATH" => "#{node.bosh_bin_dir}:#{ENV['PATH']}"
  })
  action :run
end


