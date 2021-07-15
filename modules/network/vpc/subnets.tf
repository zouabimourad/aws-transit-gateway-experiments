resource "aws_subnet" "subnet_front" {

  count = var.availability_zones_count

  vpc_id = aws_vpc.self.id
  cidr_block = cidrsubnet(aws_vpc.self.cidr_block, var.subnets_cidr_newbits, count.index+1 )
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${var.name_prefix}-front-${local.letters[count.index]}"
  }

}

resource "aws_subnet" "subnet_appli" {

  count = var.availability_zones_count

  vpc_id = aws_vpc.self.id
  cidr_block = cidrsubnet(aws_vpc.self.cidr_block, var.subnets_cidr_newbits, count.index + 1 + var.availability_zones_count )
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${var.name_prefix}-appli-${local.letters[count.index]}"
  }

}

resource "aws_subnet" "subnet_db" {

  count = var.availability_zones_count

  vpc_id = aws_vpc.self.id
  cidr_block = cidrsubnet(aws_vpc.self.cidr_block, var.subnets_cidr_newbits, count.index + 1 + var.availability_zones_count * 2)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${var.name_prefix}-db-${local.letters[count.index]}"
  }

}

resource "aws_subnet" "subnet_net" {

  count = var.availability_zones_count

  vpc_id = aws_vpc.self.id
  cidr_block = cidrsubnet(aws_vpc.self.cidr_block, var.net_subnets_cidr_newbits, count.index + 1 )
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${var.name_prefix}-net-${local.letters[count.index]}"
  }

}