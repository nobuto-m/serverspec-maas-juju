require 'spec_helper'

describe service('jujud-machine-0') do
  it { should be_enabled }
  it { should be_running }
end

describe service('juju-db') do
  it { should be_enabled }
  it { should be_running }
end

# rsyslog
describe port(6514) do
  it { should be_listening.with('tcp') }
end
