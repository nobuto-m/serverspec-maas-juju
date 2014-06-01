require 'spec_helper'

describe service('ntp') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/ntp.conf') do
  its(:content) { should match /^server / }
end

describe command('ntpq -np | grep -q "^\*"') do
  it { should return_exit_status 0 }
end
