#!/usr/bin/env bats

load setup_path

@test "monit 5.2.4 installed" {
  run monit -V
  [ "${lines[0]}" = "This is Monit version 5.2.4" ]
}

@test "/var/vcap/bosh/etc/monitrc exists" {
  [ -f /var/vcap/bosh/etc/monitrc ]
}

@test "/var/vcap/monit/empty.monitrc required so monit always can start" {
  [ -f /var/vcap/monit/empty.monitrc ]
}

