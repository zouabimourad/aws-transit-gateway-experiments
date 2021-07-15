locals {

  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  account_code = local.account_vars.locals.aws_account_code
  env = local.environment_vars.locals.environment

}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../../../../modules/network/vpc/"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

//
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  vpc_cidr = "10.17.0.0/16"
  subnets_cidr_newbits =  4
  net_subnets_cidr_newbits = 8
  availability_zones_count = 2
  name_prefix = "${local.account_code}-${local.env}"
  transit_gateway_id = "tgw-XXX"
}
