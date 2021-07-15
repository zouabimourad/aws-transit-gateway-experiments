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

resource "aws_route_table" "route_table_private" {

  vpc_id = aws_vpc.self.id

  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = var.transit_gateway_id
  }

  tags = {
    Name = "${var.name_prefix}-private"
  }
}

resource "aws_route_table_association" "route_table_association_front_subnets" {
  count = var.availability_zones_count
  subnet_id = element(split(",", join(",", aws_subnet.subnet_front.*.id)), count.index)
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "route_table_association_appli_subnets" {
  count = var.availability_zones_count
  subnet_id = element(split(",", join(",", aws_subnet.subnet_appli.*.id)), count.index)
  route_table_id = aws_route_table.route_table_private.id
}

resource "aws_route_table_association" "route_table_association_db_subnets" {
  count = var.availability_zones_count
  subnet_id = element(split(",", join(",", aws_subnet.subnet_db.*.id)), count.index)
  route_table_id = aws_route_table.route_table_private.id
}

resource "aws_route_table_association" "route_able_association_net_subnets" {
  count = var.availability_zones_count
  subnet_id = element(split(",", join(",", aws_subnet.subnet_net.*.id)), count.index)
  route_table_id = aws_route_table.route_table_private.id
}