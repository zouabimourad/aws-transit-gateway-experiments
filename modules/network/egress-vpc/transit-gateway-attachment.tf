resource "aws_ec2_transit_gateway_vpc_attachment" "self" {
  subnet_ids = aws_subnet.subnet_private.*.id
  transit_gateway_id = var.transit_gateway_id
  vpc_id = aws_vpc.self.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
}



