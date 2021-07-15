resource "aws_eip" "bastion_eip" {
  tags = {
    Name = "bastion"
  }
}

resource "aws_eip_association" "eip_association_bastion" {
  instance_id = aws_instance.instance_bastion.id
  allocation_id = aws_eip.bastion_eip.id
}

resource "aws_instance" "instance_bastion" {
  ami = var.bastion_ami
  instance_type = var.bastion_instance_type

  subnet_id = aws_subnet.subnet_public[0].id
  key_name = var.bastion_key_name

  tags = {
    Name = "bastion"
  }

  vpc_security_group_ids = [
    aws_security_group.security_group_bastion.id]
}

resource "aws_security_group" "security_group_bastion" {
  name = "bastion"
  vpc_id = aws_vpc.self.id
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "all"
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}