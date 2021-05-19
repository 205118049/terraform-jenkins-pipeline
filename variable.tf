variable "region" { default = "ap-southeast-2" }
variable "instance_type" { default = "t2.micro" }
variable "key_name" { default = "kenopsy" }

 variable "ssh_private_key_file" { default = "kenopsy.pem"}
  locals {ssh_private_key_content = file(var.ssh_private_key_file)}