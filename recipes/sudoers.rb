# echo '#includedir /etc/sudoers.d' >> $chroot/etc/sudoers
ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/sudoers")
    file.insert_line_if_no_match("#includedir /etc/sudoers.d", "#includedir /etc/sudoers.d")
    file.write_file
  end
end
