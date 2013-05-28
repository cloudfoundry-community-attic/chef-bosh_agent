directory node.bosh_src_dir do
  mode "0755"
  recursive true
  action :create
end

# get ruby source tgz (unless correct ruby installed)
remote_file "#{node.bosh_src_dir}/#{node.bosh_agent.ruby_archive}" do
  source node.bosh_agent.ruby_url
  checksum node.bosh_agent.ruby_md5
  action :create_if_missing
end

execute "install ruby" do
  command <<-BASH
bosh_dir='#{node.bosh_dir}'
ruby_basename='#{node.bosh_agent.ruby_basename}'
ruby_archive='#{node.bosh_agent.ruby_archive}'

cd $bosh_dir/src
tar zxvf $ruby_archive
cd $ruby_basename
./configure --prefix=$bosh_dir --disable-install-doc
make -j4 && make install
  BASH
  action :run
  not_if { ::File.exists?(File.join(node.bosh_bin_dir, "ruby")) }
end

# get rubygems tgz (unless gem version correct)
# TODO install rubygems

execute "install bundler rubygem" do
  command "gem install bundler --conservative --no-rdoc --no-ri -r"
  environment({
    "PATH" => "#{node.bosh_bin_dir}:#{ENV['PATH']}"
  })
  action :run
end
