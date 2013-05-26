bosh_app_dir = "/var/vcap"
bosh_dir = "#{bosh_app_dir}/bosh"
bosh_src_dir = File.join(bosh_dir, "src")

monit_basename = "monit-5.2.4"
monit_archive = "#{monit_basename}.tar.gz"
monit_md5 = "feabdd2c0e3263eadaf5359841b92a9e6d4824819b1df7b2b49d9727a849b4cf"

directory bosh_src_dir do
  mode "0755"
  recursive true
  action :create
end

# get ruby source tgz (unless correct ruby installed)
remote_file "#{bosh_dir}/src/#{monit_archive}" do
  source "http://mmonit.com/monit/dist/#{monit_archive}"
  checksum monit_md5
  action :create_if_missing
end

execute "install monit" do
  command <<-BASH
bosh_dir='#{bosh_dir}'
monit_basename='#{monit_basename}'
monit_archive='#{monit_archive}'

cd $bosh_dir/src
tar zxvf $monit_archive
cd $monit_basename
./configure --prefix=$bosh_dir --without-ssl
make -j4 && make install
  BASH
  action :run
  not_if { ::File.exists?(File.join(bosh_dir, "bin/monit")) }
end

directory "#{bosh_dir}/etc" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

cookbook_file "#{bosh_dir}/etc/monitrc" do
  source "monit/monitrc"
  owner "root"
  group "root"
  mode "0700"
end

directory "#{bosh_app_dir}/monit" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

cookbook_file "#{bosh_app_dir}/monit/empty.monitrc" do
  source "monit/empty.monitrc"
  owner "root"
  group "root"
  mode "0644"
end
