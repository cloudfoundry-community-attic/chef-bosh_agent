#!/usr/bin/env bats

load setup_path

@test "bosh_agent executable installed" {
  run which bosh_agent
  [ "${lines[0]}" = "/var/vcap/bosh/bin/bosh_agent" ]
}

@test "/etc/service/agent links to /etc/sv/agent" {
  [ "$(readlink -nf /etc/service/agent)" == "/etc/sv/agent" ]
}

@test "/etc/service/agent/run exists to run the service via runit" {
  [ -x /etc/service/agent/run ]
}


@test "/var/vcap/bosh/state.yml exits" {
  [ -f /var/vcap/bosh/state.yml ]
}

# TODO - hourly logrotate