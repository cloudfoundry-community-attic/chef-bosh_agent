#!/usr/bin/env bats

@test "vcap user exists" {
  cat /etc/passwd | grep vcap
}

@test "~vcap home dir exists" {
  [ -d /home/vcap ]
}
