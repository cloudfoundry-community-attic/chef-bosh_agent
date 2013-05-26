#!/usr/bin/env bats

@test "sysstat file exists" {
  [ -f /etc/default/sysstat ]
}
