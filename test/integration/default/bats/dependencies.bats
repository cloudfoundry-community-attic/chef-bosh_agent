#!/usr/bin/env bats

@test "ruby 1.9.3-p429 is default" {
  PATH=/var/vcap/bosh/bin:$PATH
  run ruby -v
  [ "$(echo ${lines[0]} | awk '{print $2}')" = "1.9.3p429" ]
}
