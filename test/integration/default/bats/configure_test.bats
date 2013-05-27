#!/usr/bin/env bats

@test "/etc/infrastructure exists" {
  [ -f /etc/infrastructure ]
}

@test "/var/vcap/bosh/settings.json exists" {
  [ -f /var/vcap/bosh/settings.json ]
}
