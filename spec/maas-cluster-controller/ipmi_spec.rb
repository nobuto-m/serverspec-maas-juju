require 'spec_helper'

ipmi_network = property[:ipmi_network].to_s

if ipmi_network.length > 0
  describe command('ip route') do
    it { should return_stdout /#{Regexp.escape(ipmi_network)} / }
  end
end
