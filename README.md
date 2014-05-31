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
