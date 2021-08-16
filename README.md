![diagram](terraform.png)
## Launching an EC2
- Once terraform file `main.tf` is configured we can launch the EC2 using `terraform plan` to validate the file then `terraform apply` to launch the EC2
- EC2 instances can be destroyed using `terraform destroy`

![picture](vpc.png)

Create a new key pair in your local .ssh folder
Run: `ssh-keygen -t rsa -b 2048 -v -f eng89_your_name`

Create new .pem key and add to .ssh folder
Go to aws -> ec2 -> key pairs -> Create key pair -> .pem -> create
Put new .pem file in .ssh folder

Check out varaible.tf file
Check out main.tf file to see the code required to create an instance

Check and run main.tf
`terraform init` # Initialise terraform
`terraform plan` # To check if everything works, no syntax errors
`terraform apply` # Runs the main.tf file

## Ensure access and secret are added to env vars 

- Lets build a script to connect to AWS nad setup all dependencies required
- keyword: provider aws
- then we will run terraform init
- then wwill move onto launching AWS services
- Lets launhc an EC2 instance in eu-west-1 with
- keywith called "resource" provide resource name and give name with sspecific details to service
- resource aws_ec2_instance, name it as eng89_name_terraform, ami, type of instance, with or without ip,
- provide type of instance 
- assign public ip for this instance
- tags is the keyword to name the instance 


```JSON
provider "aws" {
     region = "eu-west-1"

}

resource "aws_instance" "app_instance" {
ami = "ami-038d7b856fe7557b3"
instance_type = "t2.micro"
associate_public_ip_address = true
key_name = var.AWS_KEY_NAME

tags = {
    Name = "eng89_mueed_terraform"

    }


}
```