resource "aws_subnet" "subnet_public" {

  count = local.availability_zones_count

  vpc_id = aws_vpc.self.id
  cidr_block = cidrsubnet(aws_vpc.self.cidr_block, var.subnets_cidr_newbits, count.index+1 )
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${var.name_prefix}-public-${local.letters[count.index]}"
  }

}


resource "aws_subnet" "subnet_private" {

  count = local.availability_zones_count

  vpc_id = aws_vpc.self.id
  cidr_block = cidrsubnet(aws_vpc.self.cidr_block, var.subnets_cidr_newbits, count.index + 1 + local.availability_zones_count )
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${var.name_prefix}-private-${local.letters[count.index]}"
  }

}