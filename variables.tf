variable "project_name" {
  description = "this name will be used to name resources"
  default = "chef"
}

variable "aws_ec2_instance_type" {
  description = "profile name configured in ~/.aws/credentials file"
  default = "t2.medium"
}

variable "aws_ec2_subnet_tag_name" {
  description = "aws private subnet tag name"
  default = "public-us-west-2c"
}

variable "boot_disk_size" {
  description = "boot disk size in GB"
  default = 20
}

variable "boot_disk_type" {
  description = "boot disk type in GB"
  default = "standard"
}

variable "data_backup_disk_size" {
  description = "backup data disk size in GB"
  default = 20
}

variable "data_backup_disk_type" {
  description = "backup data disk type in GB"
  default = "standard"
}

variable "aws_ec2_keypair" {
  description = "aws ec2 keypair"
}

variable "domain_name" {
  description = "domain name for R53 dns record creation"
}

variable "ec2_termination_protection" {
  description = "Protect instance from termination. `terraform destroy` will not delete"
  default = false
}

variable "chef_server_package_url" {
  description = "Get package url from: https://downloads.chef.io/chef-server"
  default = "https://packages.chef.io/files/stable/chef-server/12.17.33/ubuntu/16.04/chef-server-core_12.17.33-1_amd64.deb"
}
