#!/bin/sh

setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config
systemctl stop firewalld && systemctl disable firewalld
swapoff -a
sed -e '/swap/s/^/#/g' -i /etc/fstab
yum install ntpdate -y
ntpdate time.nist.gov

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce-20.10.12 docker-ce-cli-20.10.12 -y
systemctl enable docker --now
docker version

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install -y kubelet-1.23.4 kubeadm-1.23.4 kubectl-1.23.4
systemctl enable kubelet --now

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm -f get_helm.sh
ln -s /usr/local/bin/helm /usr/bin/helm

grep "net.ipv4.ip_forward" /etc/sysctl.conf && sed -i -e "s/(net.ipv4.ip_forward\s*\=\s*)0/\11/g" /etc/sysctl.conf || echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
grep "net.bridge.bridge-nf-call-iptables" /etc/sysctl.conf && sed -i -e "s/(net.bridge.bridge-nf-call-iptables\s*\=\s*)0/\11/g" /etc/sysctl.conf || echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf