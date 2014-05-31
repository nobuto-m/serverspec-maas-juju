require 'spec_helper'

services=['maas-cluster-celery', 'maas-dhcp-server', 'maas-pserv']

describe package('maas-cluster-controller') do
  it { should be_installed }
end

services.each do |service|
  describe service("#{service}") do
    it { should be_enabled }
    it { should be_running }
  end
end

describe file('/etc/maas/dhcpd.conf') do
  its(:content) { should match /^subnet / }
end

describe command('test -L /var/lib/maas/boot-resources/current') do
  it { should return_exit_status 0 }
end
