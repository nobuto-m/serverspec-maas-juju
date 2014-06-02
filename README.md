serverspec-maas-juju
====================

This spec assumes to be executed on Juju client node with serverspec.

Regarding serverspec itself, please refer:
 - http://serverspec.org/
 - https://github.com/serverspec/serverspec
 
## install serverspec

```bash
$ sudo apt-get intall --no-install-recommends ruby-serverspec
```
(Ubuntu 14.04 LTS or higher)

## execute serverspec

1. clone this repo.

   ```bash
$ git clone https://github.com/nobuto-m/serverspec-maas-juju.git
```

1. edit properties.yml to match your environment.

   ```bash
$ cd serverspec-maas-juju/
$ editor properties.yml
```

1. run.

   ```bash
$ rake spec --trace
```

You can also run spec per node.

```bash
$ rake -T
rake serverspec:juju-bootstrap  # Run serverspec to juju-bootstrap
rake serverspec:maas            # Run serverspec to maas
rake serverspec:node1           # Run serverspec to node1
rake serverspec:node2           # Run serverspec to node2
rake serverspec:node3           # Run serverspec to node3
rake serverspec:node4           # Run serverspec to node4
rake serverspec:node5           # Run serverspec to node5
rake spec                       # Run serverspec to all hosts
```

## example output

If the maas server is:
 - not synced with upstream ntp servers
 - not having any route to IPMI network
 - not configured to manage DHCP and DNS
 - not having boot resources

The output will look like:

```bash
$ rake serverspec:maas --trace
** Invoke serverspec:maas (first_time)
** Execute serverspec:maas
/usr/bin/ruby2.1 -S rspec spec/base/bonding_spec.rb spec/base/ntpd_spec.rb spec/base/timezone_spec.rb spec/maas-cluster-controller/ipmi_spec.rb spec/maas-cluster-controller/maas-cluster_spec.rb spec/maas-region-controller/internet-connectivity_spec.rb spec/maas-region-controller/maas-region_spec.rb
FFF.F....F..FF.................F

<snip>

Finished in 6.73 seconds
32 examples, 8 failures

Failed examples:

rspec ./spec/base/ntpd_spec.rb:4 # Service "ntp" should be enabled
rspec ./spec/base/ntpd_spec.rb:5 # Service "ntp" should be running
rspec ./spec/base/ntpd_spec.rb:9 # Command "ntpq -np | grep -q "^\*"" should return exit status 0
rspec ./spec/maas-cluster-controller/ipmi_spec.rb:7 # Command "ip route" should return stdout /10\.99\.0\.0\/16 /
rspec ./spec/maas-cluster-controller/maas-cluster_spec.rb:18 # Service "maas-dhcp-server" should be running
rspec ./spec/maas-cluster-controller/maas-cluster_spec.rb:23 # File "/etc/maas/dhcpd.conf" content should match /^subnet /
rspec ./spec/maas-cluster-controller/maas-cluster_spec.rb:27 # Command "test -L /var/lib/maas/boot-resources/current" should return exit status 0
rspec ./spec/maas-region-controller/maas-region_spec.rb:17 # File "/etc/bind/maas/named.conf.maas" content should match /^zone /
```
