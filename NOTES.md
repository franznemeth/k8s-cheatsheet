# kubectl oneliners 
These scripts can be used as subcommands for kubectl to serve a specific purpose
## Installation
```bash
sudo cp ./kubectl-* /usr/local/bin/
```

## Desciption
### kubectl-resources
This oneliner shows you the resource limits/requests for pods in a namespace or all namespaces

Usage example: 
```shell
# Supports --all-namespaces
kubectl resources
```
### kubectl-containerids
This oneliner shows you the associated containerids for kubernetes pods. 
It can be used to debug a container directly on the node. The containerId matches the ID on the node itsself

Usage example:
```shell
# Supports --all-namespaces
kubectl containerids
```
### kubectl-geteverything
This oneliner shows all (and by that it means every resource/cr) in a namespace.
It requires an argument which is the name of the namespace in question.

It may be used to debug a namespace stuck in terminating state to find out which resources remain.

Usage exmaple:
```shell
kubectl geteverything my-namespace
```
### kubectl-finalize-namespace
This is a dangerous script but sometimes necessary to get rid of a namespace which is stuck in Terminating state

**Run this script with extrem caution!**

Usage example:
```shell
kubectl finalize namespace some-namespace --yes-i-really-mean-it
```