require 'spec_helper'

describe file('/etc/timezone') do
  its(:content) { should match /^#{property[:timezone]}$/ }
end
