#transit gateway route table
resource "aws_ec2_transit_gateway_route_table" "route_table_non_prod_staging" {

  transit_gateway_id = var.transit_gateway_id

  tags = {
    Name = "non-prod-staging"
  }

}

// self
resource "aws_ec2_transit_gateway_route_table_association" "non_prod_staging" {
  transit_gateway_attachment_id  = var.non_prod_staging_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_staging.id
}

// propagations
// self
resource "aws_ec2_transit_gateway_route_table_propagation" "non_prod_staging" {
  transit_gateway_attachment_id  = var.non_prod_staging_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_staging.id
}

// service egress
resource "aws_ec2_transit_gateway_route_table_propagation" "non_prod_staging_service_egress" {
  transit_gateway_attachment_id  = var.service_egress_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_staging.id
}

// static routes
// internet
resource "aws_ec2_transit_gateway_route" "non_prod_staging_stagingernet" {
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table_non_prod_staging.id
  transit_gateway_attachment_id = var.service_egress_attachment_id
}