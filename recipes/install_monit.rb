directory node.bosh_src_dir do
  mode "0755"
  recursive true
  action :create
end

# get ruby source tgz (unless correct ruby installed)
remote_file "#{node.bosh_src_dir}/#{node.bosh_agent.monit_archive}" do
  source node.bosh_agent.monit_url
  checksum node.bosh_agent.monit_md5
  action :create_if_missing
end

execute "install monit" do
  command <<-BASH
bosh_dir='#{node.bosh_dir}'
monit_basename='#{node.bosh_agent.monit_basename}'
monit_archive='#{node.bosh_agent.monit_archive}'

cd $bosh_dir/src
tar zxvf $monit_archive
cd $monit_basename
./configure --prefix=$bosh_dir --without-ssl --without-pam
make -j4 && make install
  BASH
  action :run
  not_if do
    ::File.exists?(File.join(node.bosh_bin_dir, "monit")) &&
    `#{File.join(node.bosh_bin_dir, "monit")} -V` =~ /This is Monit version #{node.bosh_agent.monit_version}/
  end
end

directory "#{node.bosh_dir}/etc" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

cookbook_file "#{node.bosh_dir}/etc/monitrc" do
  source "monit/monitrc"
  owner "root"
  group "root"
  mode "0700"
end

directory "#{node.bosh_app_dir}/monit" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

cookbook_file "#{node.bosh_app_dir}/monit/empty.monitrc" do
  source "monit/empty.monitrc"
  owner "root"
  group "root"
  mode "0644"
end
