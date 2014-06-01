require 'spec_helper'

# check all packages in virsh-host^ are installed
describe command('apt-get install -s virt-host^ | grep -q ^Inst\ ') do
  it { should return_exit_status 1 }
end

describe command('kvm-ok') do
  it { should return_stdout /KVM acceleration can be used/ }
end
