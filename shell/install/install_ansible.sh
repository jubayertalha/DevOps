#!/bin/sh

sudo apt remove ansible
sudo apt --purge autoremove

sudo apt update
sudo apt upgrade

sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt update

sudo apt install ansible

sudo apt install python3-argcomplete
sudo activate-global-python-argcomplete3

#ansible-config init --disabled > ansible.cfg
#sudo chmod 600 /home/azureuser/kmaster_key.pem 
#cat ansible.cfg | grep private_key_file
#private_key_file = /home/azureuser/kmaster_key.pem
#sed -i 's/#private_key_file =/private_key_file = \/home\/azureuser\/kmaster_key.pem/g' ansible.cfg

ansible --version