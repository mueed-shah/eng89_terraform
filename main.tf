# provider "aws" {
#      region = var.AWS_REGION
#      }


# resource "aws_instance" "app_instance" {
# ami = "ami-038d7b856fe7557b3"
# instance_type = "t2.micro"
# associate_public_ip_address = true
# key_name = var.AWS_KEY_NAME

# tags = {
#     Name = "eng89_mueed_terraform"

#     }


# }

provider "aws" {
  region = var.aws_region
}

# Let's create a VPC  
resource "aws_vpc" "terraform_vpc" {
  cidr_block       = var.cidr_block 
  #"10.214.0.0/16"
  instance_tenancy = "default"
  
  tags = {
    Name = var.vpc_name
  }
} 

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = "10.214.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "eu-west-1a"
    tags = {
        Name = "eng89_mueed_tf_app"
    }
}

resource "aws_subnet" "prod-subnet-private-1" {
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = "10.214.2.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "eu-west-1a"
    tags = {
        Name = "eng89_mueed_tf_db"
    }
}


# Create Internet Gateway
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = var.igw_name
  }
}

#Create Custom Route Table
resource "aws_route_table" "terraform_route" {
    vpc_id = aws_vpc.terraform_vpc.id
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.terraform_igw.id
    }
    
    tags = {
        Name = var.route_name
    }
}

resource "aws_route_table_association" "prod-crta-public-subnet-1"{
    subnet_id = aws_subnet.prod-subnet-public-1.id
    route_table_id = aws_route_table.terraform_route.id
}

resource "aws_route_table_association" "prod-crta-private-subnet-1"{
    subnet_id = aws_subnet.prod-subnet-private-1.id
    route_table_id = aws_route_table.terraform_route.id
}


# launch an instance
resource "aws_instance" "app_instance" {
  ami           = var.app_ami_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.prod-subnet-public-1.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  tags = {
      Name = var.name
  }
   #The key_name to ssh into instance
  key_name = var.aws_key_name
  #aws_key_path = var.aws_key_path
  provisioner "remote-exec" {
    inline = [
         "cd app"
    ]
  }

  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.aws_key_path)
      host        = self.public_ip
    }
}

# launch an instance
resource "aws_instance" "db_instance" {
  ami = "ami-0580ded6615abd4c3"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.prod-subnet-private-1.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  tags = {
      Name = "eng89_mueed_db_terraform"
  }
   #The key_name to ssh into instance
  key_name = var.aws_key_name
  #aws_key_path = var.aws_key_path
    provisioner "remote-exec" {
    inline = [
         "ls",
         "pwd"
    ]
  }

  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.aws_key_path)
      host        = self.public_ip
    }
}


