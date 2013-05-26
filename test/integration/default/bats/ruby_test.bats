#!/usr/bin/env bats

load setup_path

@test "ruby 1.9.3-p429 is default" {
  run ruby -v
  [ "$(echo ${lines[0]} | awk '{print $2}')" = "1.9.3p429" ]
}

@test "rubygems 1.8.23" {
  run gem -v
  [ "${lines[0]}" = "1.8.23" ]
}
