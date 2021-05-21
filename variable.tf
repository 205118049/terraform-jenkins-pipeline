variable "region" { default = "ap-northeast-1" }
variable "instance_type" { default = "t2.micro" }
variable "key_name" { default = "kenopsy" }
//yourProfilename -  profile
 //variable "ssh_private_key_file" { default = "kenopsy.pem"}
 
 //locals {private_key = file(var.ssh_private_key_file)}