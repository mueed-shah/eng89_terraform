# Lets build a script to connect to AWS nad setup all dependencies required
# keyword: provider aws

provider "aws" {
     region = "eu-west-1"

}

# then we will run terraform init

# then wwill move onto launching AWS services

# Lets launhc an EC2 instance in eu-west-1 with

# keywith called "resource" provide resource name and give name with sspecific details to service
resource "aws_instance" "app_instance" {
# resource aws_ec2_instance, name it as eng89_name_terraform, ami, type of instance, with or without ip,
ami = "ami-038d7b856fe7557b3"
# provide type of instance 
instance_type = "t2.micro"
# assign public ip for this instance
associate_public_ip_address = true
# tags is the keyword to name the instance 
tags = {
    Name = "eng89_mueed_terraform"

    }
}

# most commonly used commands for terraform:
# terraform apply checks the sytnax and validates the instance 
# once we are happy and the outcome is green we could run terraform apply
