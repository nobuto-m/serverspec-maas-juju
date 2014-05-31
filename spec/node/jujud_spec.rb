require 'spec_helper'

describe command('pgrep -f "jujud machin[e]"') do
  it { should return_exit_status 0 }
end

describe command('pgrep -f "jujud uni[t]"') do
  it { should return_exit_status 0 }
end
