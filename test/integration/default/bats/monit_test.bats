#!/usr/bin/env bats

load setup_path

@test "monit 5.2.4 installed" {
  run monit -V
  [ "${lines[0]}" = "This is Monit version 5.2.4" ]
  
}
