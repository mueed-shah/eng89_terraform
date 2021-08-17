resource "aws_security_group_rule" "my_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = 
    security_group_id = 
}