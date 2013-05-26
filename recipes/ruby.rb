bosh_dir = "/var/vcap/bosh"
bosh_src_dir = File.join(bosh_dir, "src")

ruby_basename = "ruby-1.9.3-p429"
ruby_archive = "#{ruby_basename}.tar.gz"
ruby_flavor = "1.9"
ruby_md5 = "993c72f7f805a9eb453f90b0b7fe0d2b"

directory bosh_src_dir do
  mode "0755"
  recursive true
  action :create
end

# get ruby source tgz (unless correct ruby installed)
remote_file "#{bosh_dir}/src/#{ruby_archive}" do
  source "http://ftp.ruby-lang.org/pub/ruby/#{ruby_flavor}/#{ruby_archive}"
  checksum ruby_md5
  action :create_if_missing
end

execute "install ruby" do
  command <<-BASH
bosh_dir='#{bosh_dir}'
ruby_basename='#{ruby_basename}'
ruby_archive='#{ruby_archive}'

cd $bosh_dir/src
tar zxvf $ruby_archive
cd $ruby_basename
./configure --prefix=$bosh_dir --disable-install-doc
make -j4 && make install
  BASH
  action :run
  not_if { ::File.exists?(File.join(bosh_dir, "bin/ruby")) }
end

# get rubygems tgz (unless gem version correct)
# install rubygems
