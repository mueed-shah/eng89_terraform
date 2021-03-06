resource "aws_network_acl" "app_nacl" {
  vpc_id = aws_vpc.terraform_vpc.id
  subnet_ids = [aws_subnet.prod-subnet-public-1.id]

    # INBOUND
    ingress {
        protocol   = "tcp"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 80
        to_port    = 80
    }
    ingress {
        protocol   = "tcp"
        rule_no    = 110
        action     = "allow"
        cidr_block = var.my_ip
        from_port  = 22
        to_port    = 22
    }
    ingress {
        protocol   = "tcp"
        rule_no    = 120
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 1024
        to_port    = 65535
    }
    # OUTBOUND
    egress {
        protocol   = "tcp"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 80
        to_port    = 80
    }
    egress {
        protocol   = "tcp"
        rule_no    = 110
        action     = "allow"
        cidr_block = var.my_ip
        from_port  = 22
        to_port    = 22
    }
    egress {
        protocol   = "tcp"
        rule_no    = 120
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 1024
        to_port    = 65535
    }

  tags = {
    Name = var.nacl_app_name
  }
}
