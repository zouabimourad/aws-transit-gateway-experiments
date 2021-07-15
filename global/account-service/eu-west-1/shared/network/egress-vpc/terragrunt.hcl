locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  account_code = local.account_vars.locals.aws_account_code
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../../../modules/network/egress-vpc"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

//
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  vpc_cidr = "10.1.0.0/16"
  subnets_cidr_newbits = 4
  availability_zones_count = 2
  name_prefix = "${local.account_code}-egress"

  transit_gateway_id = "tgw-XXX"
  peer_vpc_cidrs = [
    "10.16.0.0/16",
    "10.16.0.0/17"]

  bastion_ami = "ami-058b1b7fe545997ae"
  bastion_instance_type = "t3.small"
  bastion_key_name = "${local.account_code}-default"

}
