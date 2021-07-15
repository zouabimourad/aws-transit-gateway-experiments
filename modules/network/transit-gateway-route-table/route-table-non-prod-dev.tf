#transit gateway route table
resource "aws_ec2_transit_gateway_route_table" "route_table_non_prod_dev" {

  transit_gateway_id = var.transit_gateway_id

  tags = {
    Name = "non-prod-dev"
  }

}

// self
resource "aws_ec2_transit_gateway_route_table_association" "non_prod_dev" {
  transit_gateway_attachment_id  = var.non_prod_dev_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_dev.id
}

// propagations
// self
resource "aws_ec2_transit_gateway_route_table_propagation" "non_prod_dev" {
  transit_gateway_attachment_id  = var.non_prod_dev_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_dev.id
}

// service egress
resource "aws_ec2_transit_gateway_route_table_propagation" "non_prod_dev_service_egress" {
  transit_gateway_attachment_id  = var.service_egress_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_dev.id
}

// static routes
// internet
resource "aws_ec2_transit_gateway_route" "non_prod_dev_devernet" {
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_dev.id
  transit_gateway_attachment_id = var.service_egress_attachment_id
}