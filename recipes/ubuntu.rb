
# Disable interactive dpkg
execute "Disable interactive dpkg" do
  command "echo 'debconf debconf/frontend select noninteractive' | debconf-set-selections"
  action :run
end

# Networking...
cookbook_file "/etc/hosts" do
  source "etc/hosts"
end

# Timezone
cookbook_file "/etc/timezone" do
  source "etc/timezone"
end

execute "dpkg-reconfigure tzdata" do
  command "dpkg-reconfigure -fnoninteractive -pcritical tzdata"
  action :run
end

# Locale
cookbook_file "/etc/default/locale" do
  source "etc/default/locale"
end

execute "dpkg-reconfigure locales" do
  command <<-SHELL
locale-gen en_US.UTF-8
dpkg-reconfigure -fnoninteractive -pcritical libc6
dpkg-reconfigure -fnoninteractive -pcritical locales
SHELL
  action :run
end

# Firstboot script
cookbook_file "/etc/rc.local" do
  source "etc/rc.local"
end

cookbook_file "/root/firstboot.sh" do
  source "root/firstboot.sh"
  mode "0755"
end

template "/etc/apt/sources.list" do
  source "sources.list.erb"
  variables({
    distrib_codename: node.lsb.codename
  })
end

include_recipe "apt"

%w[build-essential libssl-dev lsof
  strace bind9-host dnsutils tcpdump iputils-arping
  curl wget libcurl3 libcurl3-dev bison libreadline6-dev
  libxml2 libxml2-dev libxslt1.1 libxslt1-dev zip unzip
  nfs-common flex psmisc apparmor-utils iptables sysstat
  rsync openssh-server traceroute libncurses5-dev quota
  libaio1 gdb tripwire libcap2-bin libyaml-dev
].each do |pkg|
  package pkg
end