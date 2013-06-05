default[:bosh_app_dir] = "/var/vcap"
default[:bosh_dir] = File.join(node.bosh_app_dir, "bosh")
default[:bosh_src_dir] = File.join(node.bosh_dir, "src")
default[:bosh_bin_dir] = File.join(node.bosh_dir, "bin")

default[:bosh_user][:username] = "vcap" # don't change
default[:bosh_user][:password] = "c1oudc0w"
default[:bosh_user][:groups] = "admin,adm,audio,cdrom,dialout,floppy,video,plugdev,dip"

default[:bosh_agent][:ruby_basename] = "ruby-1.9.3-p429"
default[:bosh_agent][:ruby_archive] = "#{node.bosh_agent.ruby_basename}.tar.gz"
default[:bosh_agent][:ruby_flavor] = "1.9"
default[:bosh_agent][:ruby_md5] = "993c72f7f805a9eb453f90b0b7fe0d2b"
default[:bosh_agent][:ruby_url] = 
  "http://ftp.ruby-lang.org/pub/ruby/#{node.bosh_agent.ruby_flavor}/#{node.bosh_agent.ruby_archive}"

default[:bosh_agent][:monit_version] = "5.5.1"
default[:bosh_agent][:monit_basename] = "monit-#{node.bosh_agent.monit_version}"
default[:bosh_agent][:monit_archive] = "#{node.bosh_agent.monit_basename}.tar.gz"
default[:bosh_agent][:monit_md5] = "dbe4b4744a7100e2d5f4eac353dfb2df0549848e2c7661d9c19acc31cdef2c78"
default[:bosh_agent][:monit_url] = "http://mmonit.com/monit/dist/#{node.bosh_agent.monit_archive}"

default[:bosh_agent][:gem_src_url] = "https://s3.amazonaws.com/bosh-jenkins-gems/"