cookbook_file "#{node.bosh_dir}/settings.json" do
  source "local_only/settings.json"
  owner "root"
  group "root"
  mode "0644"
end