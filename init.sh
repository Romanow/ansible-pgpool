#!/bin/bash
sudo su -
useradd -m --p $(echo root | openssl passwd -1 -stdin) ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
sudo -u ansible mkdir /home/ansible/.ssh
# bug https://github.com/hashicorp/vagrant/issues/10914
apt-get update --yes
apt install software-properties-common --yes
apt-add-repository --update ppa:ansible/ansible --yes 
UCF_FORCE_CONFOLD=1 DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -qq -y install python-pip ansible
apt-get install python-pip ansible --yes
pip install --upgrade pip

sed -i 's/PasswordAuthentication no*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd