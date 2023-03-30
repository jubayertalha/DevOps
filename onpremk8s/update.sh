#!/bin/sh

# as skipping minor versions when upgrading is unsupported
# first update the kubernetes version to 1.24.x from 1.23.4
# next update the kubernetes version to 1.25.x from 1.24.x
# lastly update the kubernetes version to 1.26.x from 1.25.x

# all commands are executed as root

# on master node
mkdir /kubeadm-backup
kubeadm backup create --dir /kubeadm-backup

# determine the version of kubernetes
yum list --showduplicates kubeadm --disableexcludes=kubernetes
# find the latest 1.24 version in the list
# change the version accordingly

# on all node
# change the node name accordingly from vl-rafat-01.ibaset.com to vl-rafat-02.ibaset.com and vl-rafat-03.ibaset.com
# kubectl command is executed on master node
kubectl cordon vl-rafat-01.ibaset.com
kubectl drain vl-rafat-01.ibaset.com --ignore-daemonsets --delete-emptydir-data
yum install kubeadm-1.x.x kubelet-1.x.x kubectl-1.x.x
systemctl daemon-reload
systemctl restart kubelet
kubeadm upgrade node
kubectl uncordon vl-rafat-01.ibaset.com

# on master node
kubeadm upgrade apply v1.x.x
kubectl version --short