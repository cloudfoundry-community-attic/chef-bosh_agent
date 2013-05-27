group "vcap"

user "vcap" do
  group "vcap"
  home "/home/vcap"
  system true
  shell "/bin/bash"
  supports({ manage_home: true })
end

