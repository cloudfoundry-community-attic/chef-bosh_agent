include_recipe "bosh_agent::install_ubuntu"
include_recipe "bosh_agent::install_users"

include_recipe "bosh_agent::install_ruby"
include_recipe "bosh_agent::install_monit"

include_recipe "bosh_agent::install_sysstat"
include_recipe "bosh_agent::install_sysctl"
include_recipe "bosh_agent::install_ntpdate"
include_recipe "bosh_agent::install_sudoers"

include_recipe "bosh_agent::install_agent"

