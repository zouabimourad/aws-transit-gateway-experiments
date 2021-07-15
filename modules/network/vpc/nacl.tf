resource "aws_network_acl" "network_acl_front" {
  vpc_id = aws_vpc.self.id

  subnet_ids = aws_subnet.subnet_front.*.id

  ingress {
    protocol = "all"
    rule_no = "100"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  egress {
    protocol = "all"
    rule_no = "101"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  tags = {
    Name = "${var.name_prefix}-front"
  }

}

resource "aws_network_acl" "network_acl_appli" {
  vpc_id = aws_vpc.self.id

  subnet_ids = aws_subnet.subnet_appli.*.id

  ingress {
    protocol = "all"
    rule_no = "100"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  egress {
    protocol = "all"
    rule_no = "101"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  tags = {
    Name = "${var.name_prefix}-appli"
  }

}

resource "aws_network_acl" "network_acl_db" {
  vpc_id = aws_vpc.self.id

  subnet_ids = aws_subnet.subnet_db.*.id

  ingress {
    protocol = "all"
    rule_no = "100"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  egress {
    protocol = "all"
    rule_no = "101"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  tags = {
    Name = "${var.name_prefix}-db"
  }
}

resource "aws_network_acl" "network_acl_net" {
  vpc_id = aws_vpc.self.id

  subnet_ids = aws_subnet.subnet_net.*.id

  ingress {
    protocol = "all"
    rule_no = "100"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  egress {
    protocol = "all"
    rule_no = "101"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
    action = "allow"
  }

  tags = {
    Name = "${var.name_prefix}-net"
  }
}



