# create variables for our research is main.tf to make use of DRY

variable "AWS_KEY_NAME" {
    default = "eng89_mueed_terraform"
    }

variable "aws_region" {
    default = "eu-west-1"
}
variable "name" {
  default = "eng89_mueed_terraform_app"
}

variable "route_name" {
  default = "eng89_mueed_terraform_route"
}

variable "app_ami_id" {
  default = "ami-0a6e6cb27b2ee4a95"
}

variable "vpc_id" {

  default = "vpc-0023be647c06b130f5"
}
variable "vpc_name" {
  default = "eng89_mueed_terraform"
}
variable "cidr_block" {
  default = "10.214.0.0/16"
}
variable "igw_name" {
  default = "eng89_mueed_terraform_igw"
}

variable "aws_key_name" {

  default = "eng89_mueed_terraform"
}

variable "aws_key_path" {

  default = "~/.ssh/eng89_mueed_terraform"
}