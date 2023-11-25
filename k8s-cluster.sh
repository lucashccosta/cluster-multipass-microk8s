#!/bin/bash

./nodes/k8s-master.sh
./nodes/k8s-node1.sh
# ./nodes/k8s-node2.sh

multipass exec k8s-master -- bash -c 'microk8s add-node' | tail -1 > master_node_key.txt

multipass transfer master_node_key.txt k8s-node-1:master_node_key.txt
multipass exec k8s-node-1 -- bash -c '$(cat master_node_key.txt)'

# multipass transfer master_node_key.txt k8s-node-2:master_node_key.txt
# multipass exec k8s-node-2 -- bash -c '$(cat master_node_key.txt)'