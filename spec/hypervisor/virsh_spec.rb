require 'spec_helper'

virsh_user = property[:virsh_user]
virsh_user_home = property[:virsh_user_home]

describe command('virsh list') do
  it { should return_exit_status 0 }
end

describe user("#{virsh_user}") do
  it { should exist }
  it { should belong_to_group 'libvirtd' }
  it { should have_home_directory "#{virsh_user_home}" }
  it { should have_login_shell '/bin/bash' }
end

describe file("#{virsh_user_home}/.ssh/") do
  it { should be_owned_by "#{virsh_user}" }
  it { should be_mode 700 }
end

describe file("#{virsh_user_home}/.ssh/authorized_keys") do
  it { should be_owned_by "#{virsh_user}" }
  it { should be_mode 600 }
end
