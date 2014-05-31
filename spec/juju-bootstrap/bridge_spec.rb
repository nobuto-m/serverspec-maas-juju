require 'spec_helper'

describe kernel_module('bridge') do
  it { should be_loaded }
end
