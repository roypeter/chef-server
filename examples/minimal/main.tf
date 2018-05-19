provider "aws" {
  region  = "us-west-2"
}

module "chef_sever" {
  source = "../../"

  aws_ec2_keypair = "my-key-pair-name"
  domain_name = "chef.example.com"
}
