require 'spec_helper'

describe host('archive.ubuntu.com') do
  # dns
  it { should be_resolvable.by('dns') }
  # http
  it { should be_reachable.with( :port => 80, :proto => 'tcp' ) }
end

describe host('launchpad.net') do
  # https
  it { should be_reachable.with( :port => 443, :proto => 'tcp' ) }
end

describe host("#{property[:ntp_server]}") do
  # ntp
  it { should be_reachable.with( :port => 123, :proto => 'udp' ) }
end
