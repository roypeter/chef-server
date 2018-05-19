#!/bin/bash

logfile="/var/log/aws_userdata.log"

echo "$(date):start of userdata script"  >> $logfile  2>&1

# Mount EBS volume
backup_data_dir='/var/opt/chef-backup'
backup_data_device='/dev/xvdf'
if [ ! -f $backup_data_dir ]; then
  if [[ $(file -s $backup_data_device) = "$backup_data_device: data" ]]; then
    /sbin/mkfs -t ext4 $backup_data_device >> $logfile  2>&1

    /bin/mkdir -p $backup_data_dir >> $logfile  2>&1
    /bin/echo "$backup_data_device $backup_data_dir ext4 defaults,nofail 0 2" >> /etc/fstab

    /bin/mount -av >> $logfile  2>&1
    rm -rf $backup_data_dir/*
  fi
fi

ipaddress=$(ec2metadata --public-ipv4)

# Set hostname
hostname ${hostname}
echo ${hostname} > /etc/hostname

# Set FQDN
echo "$ipaddress ${domain_name} ${hostname}" >> /etc/hosts
echo "127.0.0.1 ${domain_name} ${hostname}" >> /etc/hosts

# Install chef sever
wget ${chef_server_package_url}
dpkg -i chef-server-core_*.deb >> $logfile  2>&1
chef-server-ctl reconfigure >> $logfile  2>&1

echo "$(date):end of userdata script"  >> $logfile  2>&1
