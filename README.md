# Chef cookbook for the bosh agent

Installs & runs the [bosh agent](https://github.com/cloudfoundry/bosh/tree/master/bosh_agent) and all its dependencies.

Represents a portable, reusable reimplementation of the bosh [stemcell_builder](https://github.com/cloudfoundry/bosh/tree/master/stemcell_builder) for the `bosh_agent` stages.

## Development

To clone the source repository and run the integration tests:

```
$ git clone git@github.com:drnic/chef-bosh_agent.git bosh_agent
$ cd bosh_agent
$ bundle
$ kitchen converge
$ kitchen verify
```

You can now SSH into the vagrant VM and test that the agent is running:

```
$ kitchen login
# ps ax
...
49276 /var/vcap/bosh/bin/ruby /var/vcap/bosh/bin/bosh_agent -c -P microcloud -I vsphere -n https://vcap:vcap@0.0.0.0:6969
49480 /var/vcap/bosh/bin/monit -I -c /var/vcap/bosh/etc/monitrc
```

The bosh agent and the monit that it controls are both running.

You can interact with the agent using the `agent_client` library:

```
# sudo su -

# gem install pry
# gem install agent_client --pre --source https://s3.amazonaws.com/bosh-jenkins-gems/
# pry
> require 'agent_client'
> api = Bosh::Agent::Client.create('https://localhost:6969', "user" => "vcap", "password" => "vcap")
> api.ping
"pong"
> api.state
=> {"deployment"=>"",
 "job"=>"",
 "index"=>"",
 "networks"=>{},
 "resource_pool"=>{},
 "packages"=>{},
 "persistent_disk"=>{},
 "configuration_hash"=>{},
 "properties"=>{},
 "agent_id"=>"micro",
 "vm"=>nil,
 "job_state"=>"running",
 "bosh_protocol"=>"1",
 "ntp"=>{"message"=>"file missing"}}

```

These gems are also installed by adding the `bosh_agent::agent_client` recipe to your run list.

## Release

There is a helpful rake task to share new cookbook versions.

```
$ rake share[1.2.3]
$ rake 'share[1.2.3]' # zsh
```

This will update the `metadata.rb` version, check the cookbook, upload the cookbook, tag the git repo. Much of this functionality comes from [knife-community](http://miketheman.github.io/knife-community/ "knife-community by miketheman") plugin.