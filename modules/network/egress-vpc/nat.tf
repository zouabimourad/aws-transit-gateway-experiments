resource "aws_eip" "eip_nat" {

  count = local.availability_zones_count

  tags = {
    Name = "eip-nat-gateway-${local.letters[count.index]}"
  }

}

resource "aws_nat_gateway" "nat_gateway" {

  count = local.availability_zones_count

  allocation_id = aws_eip.eip_nat[count.index].id
  subnet_id = aws_subnet.subnet_public[count.index].id

  tags = {
    Name = "nat-gateway-${local.letters[count.index]}"
  }

}
