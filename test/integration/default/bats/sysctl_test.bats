#!/usr/bin/env bats

@test "sysctl.conf installed" {
  [ -f /sysctl.d/60-bosh-sysctl.conf ]
}
