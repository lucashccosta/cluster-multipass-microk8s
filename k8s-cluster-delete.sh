#!/bin/bash

# multipass stop k8s-node-2
multipass stop k8s-node-1
multipass stop k8s-master

# multipass delete k8s-node-2
multipass delete k8s-node-1
multipass delete k8s-master

multipass purge