require 'spec_helper'

describe package('bridge-utils') do
  it { should be_installed }
end

describe kernel_module('bridge') do
  it { should be_loaded }
end

# needs 2 bridge. One is for DHCP, another is for IPMI
describe command('test "$(brctl show | tail -n +2 | grep ^[a-z] | wc -l)" -ge 2') do
  it { should return_exit_status 0 }
end
