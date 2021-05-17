# provider let know terraform which api to use.
# in our case provider is aws.
provider "aws" {
  profile = "Praful"           # this the profile which we created using aws configure cli command
  region  = "ap-northeast-1"    
      # this will make default region as ap-south-1 which is in mumbai
  access_key = "AKIAWI2J3LXEHXMY5TUN"
  secret_key = "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"
}