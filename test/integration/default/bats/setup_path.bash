export PATH=/var/vcap/bosh/bin:$PATH

# unset the $GEM_XXX variables from chef omnibus
#   GEM_HOME=/opt/chef/embedded/lib/ruby/gems/1.9.1
#   GEM_PATH=/opt/chef/embedded/lib/ruby/gems/1.9.1

unset GEM_PATH
unset GEM_HOME
