require 'spec_helper'

describe command('pgrep -f "jujud machine"') do
  it { should return_exit_status 0 }
end

describe command('pgrep -f "jujud unit"') do
  it { should return_exit_status 0 }
end
