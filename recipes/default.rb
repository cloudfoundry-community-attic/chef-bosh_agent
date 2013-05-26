include_recipe "bosh_agent::ubuntu"
include_recipe "bosh_agent::ruby"
include_recipe "bosh_agent::monit"
include_recipe "bosh_agent::sysstat"
include_recipe "bosh_agent::sysctl"
include_recipe "bosh_agent::ntpdate"
include_recipe "bosh_agent::sudoers"

