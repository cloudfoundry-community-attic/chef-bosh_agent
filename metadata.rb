name "bosh_agent"
version "0.1.0"
description "bosh agent"
long_description  IO.read(File.expand_path('../README.md', __FILE__))
maintainer "Dr Nic Williams"
maintainer_email "drnicwilliams@gmail.com"
license "MIT"

provides "bosh_agent::configure" # late-binding of agent to infrastructure & platform

depends "apt" # ubuntu only

supports "ubuntu", ">= 10.04"
