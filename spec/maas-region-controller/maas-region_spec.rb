require 'spec_helper'

services=['bind9', 'maas-region-celery', 'maas-txlongpoll', 'postgresql', 'rabbitmq-server', 'squid-deb-proxy']

describe package('maas-region-controller') do
  it { should be_installed }
end

services.each do |service|
  describe service("#{service}") do
    it { should be_enabled }
    it { should be_running }
  end
end

describe file('/etc/bind/maas/named.conf.maas') do
  its(:content) { should match /^zone / }
end
