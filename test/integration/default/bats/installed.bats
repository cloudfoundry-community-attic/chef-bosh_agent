#!/usr/bin/env bats

@test "bosh_agent executable installed" {
  run which bosh_agent
}
