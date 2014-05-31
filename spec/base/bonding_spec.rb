require 'spec_helper'

if property[:bonding]
  describe package('ifenslave') do
    it { should be_installed }
  end

  describe file('/etc/modules') do
    its(:content) { should match /^bonding$/ }
  end

  describe kernel_module('bonding') do
    it { should be_loaded }
  end

  describe file('/proc/net/bonding/bond0') do
    it { should be_file }
    its(:content) { should match /Slave Interface/ }
  end
end
