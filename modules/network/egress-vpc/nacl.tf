resource "aws_network_acl" "network_acl_public" {
  vpc_id = aws_vpc.self.id

  subnet_ids = aws_subnet.subnet_public.*.id

  ingress {
    protocol = "all"
    rule_no = 001
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  egress {
    protocol = "all"
    rule_no = 002
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  tags = {
    Name = "${var.name_prefix}-front"
  }

}

resource "aws_network_acl" "network_acl_private" {
  vpc_id = aws_vpc.self.id

  subnet_ids = aws_subnet.subnet_private.*.id

  ingress {
    protocol = "all"
    rule_no = 001
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  egress {
    protocol = "all"
    rule_no = 002
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  tags = {
    Name = "${var.name_prefix}-appli"
  }

}

