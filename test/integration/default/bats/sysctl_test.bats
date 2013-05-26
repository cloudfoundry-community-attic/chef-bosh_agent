#!/usr/bin/env bats

@test "sysctl.conf installed" {
  [ -f /etc/sysctl.d/60-bosh-sysctl.conf ]
}
