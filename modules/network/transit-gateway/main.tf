resource "aws_ec2_transit_gateway" "this" {

  description = "core-transit-gateway"

  auto_accept_shared_attachments = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name = "core-transit-gateway"
  }

}

resource "aws_ram_resource_share" "ram_resource_share_transit_gateway" {
  name = "core-transit-gateway"
  allow_external_principals = false
}

resource "aws_ram_resource_association" "core-tgw" {
  resource_arn = aws_ec2_transit_gateway.this.arn
  resource_share_arn = aws_ram_resource_share.ram_resource_share_transit_gateway.arn
}

resource "aws_ram_principal_association" "self" {
  for_each = {for account in var.association_accounts:  account => account}

  principal = each.key
  resource_share_arn = aws_ram_resource_share.ram_resource_share_transit_gateway.arn
}

