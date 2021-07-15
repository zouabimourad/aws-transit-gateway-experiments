#egress vpc route table
resource "aws_ec2_transit_gateway_route_table" "route_table_service_egress" {
  transit_gateway_id = var.transit_gateway_id

  tags = {
    Name = "service_egress"
  }

}

// self
resource "aws_ec2_transit_gateway_route_table_association" "service_egress" {
  transit_gateway_attachment_id  = var.service_egress_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_service_egress.id
}

// propagations
// self
resource "aws_ec2_transit_gateway_route_table_propagation" "service_egress" {
  transit_gateway_attachment_id  = var.service_egress_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_service_egress.id
}

// non prod dev
resource "aws_ec2_transit_gateway_route_table_propagation" "service_egress_non_prod_dev" {
  transit_gateway_attachment_id  = var.non_prod_dev_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_service_egress.id
}

// non prod staging
resource "aws_ec2_transit_gateway_route_table_propagation" "service_egress_non_prod_staging" {
  transit_gateway_attachment_id  = var.non_prod_staging_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_service_egress.id
}