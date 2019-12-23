provider "aws" {
  region = "ap-south-1"	
  access_key = "AKIAITNFGZA4ML3U45IA"
  secret_key = "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"
  version = "~> 2.43"
}

variable "environment" {
   default = "dev"
}

terraform {
  backend "s3" {  
    bucket ="terraformcoveuiapp"
    key = "dev/coveuiapp-terraform.tfstate"
    region = "ap-south-1" 
  }
}

resource "aws_instance" "coveui-app-instance" {
  ami             = "ami-0ce933e2ae91880d3"
  instance_type   = "t2.medium"
  key_name        = "test"
  security_groups = ["default"]
  tags = { 
  Name = "${var.environment}-coveui-app"
}
}

output "PUBLIC_DNS_NAME" {
  value       = aws_instance.coveui-app-instance.public_dns
}
