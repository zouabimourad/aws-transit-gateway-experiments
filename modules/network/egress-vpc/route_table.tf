resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.self.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.self.id
  }

  tags = {
    Name = "${var.name_prefix}-public"
  }
}

resource "aws_route" "route_to_vpcs" {
  for_each = {for cidr in var.peer_vpc_cidrs:  cidr => cidr}

  cidr_block = each.key
  route_table_id = aws_route_table.route_table_public.id
  transit_gateway_id = var.transit_gateway_id
}

resource "aws_route_table" "route_table_private" {
  count = local.availability_zones_count
  vpc_id = aws_vpc.self.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }

  tags = {
    Name = "${var.name_prefix}-private-${local.letters[count.index]}"
  }
}

resource "aws_route_table_association" "route_table_association_front_subnets" {
  count = 2

  subnet_id = element(split(",", join(",", aws_subnet.subnet_public.*.id)), count.index)
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "route_table_association_appli_subnets" {
  count = 2

  subnet_id = element(split(",", join(",", aws_subnet.subnet_private.*.id)), count.index)
  route_table_id = aws_route_table.route_table_private[count.index].id
}

