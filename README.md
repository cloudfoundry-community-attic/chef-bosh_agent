# Chef cookbook for the bosh agent

Installs & runs the [bosh agent](https://github.com/cloudfoundry/bosh/tree/master/bosh_agent) and all its dependencies.

Represents a portable, reusable reimplementation of the bosh [stemcell_builder](https://github.com/cloudfoundry/bosh/tree/master/stemcell_builder) for the `bosh_agent` stages.

## Development

To clone the source repository and run the integration tests:

```
$ git clone git@github.com:drnic/chef-bosh_agent.git bosh_agent
$ cd bosh_agent
$ bundle
$ kitchen test
```

## Release

There is a helpful rake task to share new cookbook versions.

```
$ rake share[1.2.3]
$ rake 'share[1.2.3]' # zsh
```

This will update the `metadata.rb` version, check the cookbook, upload the cookbook, tag the git repo. Much of this functionality comes from [knife-community](http://miketheman.github.io/knife-community/ "knife-community by miketheman") plugin.