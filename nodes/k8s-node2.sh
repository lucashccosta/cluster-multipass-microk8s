#!/bin/bash

# Create master VM
multipass launch --name k8s-node-2 --cpus 2 --memory 2G --disk 8G

# Install microk8s
multipass exec k8s-node-2 -- bash -c 'sudo apt-get update | sudo apt-get upgrade -y'
multipass exec k8s-node-2 -- bash -c 'sudo snap install microk8s --classic --channel=1.28'
multipass exec k8s-node-2 -- bash -c 'sudo usermod -a -G microk8s $USER'
multipass exec k8s-node-2 -- bash -c 'microk8s status --wait-ready'