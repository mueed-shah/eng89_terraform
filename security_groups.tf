resource "aws_security_group" "app_sg" {
    vpc_id = aws_vpc.terraform_vpc_code_test.id
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
        cidr_blocks = ["86.2.40.6/32"]
    }
    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "eng89_mueed_terraform_appsg"
    }
}