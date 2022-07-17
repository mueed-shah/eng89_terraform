resource "aws_security_group" "app_sg" {
    vpc_id = aws_vpc.terraform_vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }
    // Nginx
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
        ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "eng89_mueed_terraform_appsg"
    }
}

resource "aws_security_group" "db_sg" {
    vpc_id = aws_vpc.terraform_vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // Allow only me to SSH to app
        cidr_blocks = [var.my_ip]
    }
    ingress {
        from_port = 1024
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
        ingress {
        from_port = 27017
        to_port = 27017
        protocol = "tcp"
        cidr_blocks = ["10.214.1.0/24"]
    }
    tags = {
        Name = "eng89_mueed_terraform_appsg"
    }
}
