default[:bosh_app_dir] = "/var/vcap"
default[:bosh_dir] = File.join(node.bosh_app_dir, "bosh")
default[:bosh_src_dir] = File.join(node.bosh_dir, "src")
default[:bosh_bin_dir] = File.join(node.bosh_dir, "bin")

default[:bosh_agent][:ruby_basename] = "ruby-1.9.3-p429"
default[:bosh_agent][:ruby_archive] = "#{node.bosh_agent.ruby_basename}.tar.gz"
default[:bosh_agent][:ruby_flavor] = "1.9"
default[:bosh_agent][:ruby_md5] = "993c72f7f805a9eb453f90b0b7fe0d2b"
default[:bosh_agent][:ruby_url] = 
  "http://ftp.ruby-lang.org/pub/ruby/#{node.bosh_agent.ruby_flavor}/#{node.bosh_agent.ruby_archive}"

default[:bosh_agent][:monit_basename] = "monit-5.2.4"
default[:bosh_agent][:monit_archive] = "#{node.bosh_agent.monit_basename}.tar.gz"
default[:bosh_agent][:monit_md5] = "feabdd2c0e3263eadaf5359841b92a9e6d4824819b1df7b2b49d9727a849b4cf"
default[:bosh_agent][:monit_url] = "http://mmonit.com/monit/dist/#{node.bosh_agent.monit_archive}"

default[:bosh_agent][:gem_src_url] = "https://s3.amazonaws.com/bosh-jenkins-gems/"