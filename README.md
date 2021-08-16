![diagram](terraform.png)
## Launching an EC2
- Once terraform file `main.tf` is configured we can launch the EC2 using `terraform plan` to validate the file then `terraform apply` to launch the EC2
- EC2 instances can be destroyed using `terraform destroy`

![diagram](vpc.png)

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