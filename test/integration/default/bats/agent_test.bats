#!/usr/bin/env bats

load setup_path

@test "bosh_agent executable installed" {
  run which bosh_agent
  [ "${lines[0]}" = "/var/vcap/bosh/bin/bosh_agent" ]
}

@test "/etc/sv/agent links to /etc/service/agent" {
  [ "$(readlink -nf /etc/sv/agent)" -eq "/etc/service/agent" ]
}


@test "/var/vcap/bosh/state.yml exits" {
  [ -f /var/vcap/bosh/state.yml ]
}

# TODO - hourly logrotate