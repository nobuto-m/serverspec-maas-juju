require 'spec_helper'

timezone = property[:timezone]
timezone = 'Etc/UTC' if timezone.nil?

describe file('/etc/timezone') do
  its(:content) { should match /^#{timezone}$/ }
end
