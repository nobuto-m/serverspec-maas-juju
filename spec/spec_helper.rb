require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS
include Serverspec::Helper::Properties

properties = YAML.load_file('properties.yml')

RSpec.configure do |c|
  c.host  = ENV['TARGET_HOST']
  service  = ENV['TARGET_SERVICE']
  set_property properties[service]
  options = Net::SSH::Config.for(c.host)
  user    = property[:user] || 'ubuntu'
  c.ssh   = Net::SSH.start(c.host, user, options)
  c.os    = backend.check_os
end
