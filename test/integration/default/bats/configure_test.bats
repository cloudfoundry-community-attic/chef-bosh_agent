#!/usr/bin/env bats

@test "/etc/infrastructure exists" {
  [ -f /etc/infrastructure ]
}
