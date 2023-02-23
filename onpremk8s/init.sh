#!/bin/sh

sudo su

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