locals {
  # Automatically load environment-level variables
  //environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  //env = local.environment_vars.locals.environment
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../../../modules/network/transit-gateway-route-table/"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

//
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  transit_gateway_id = "tgw-XXX"
  service_egress_attachment_id = "tgw-attach-XXX"
  non_prod_dev_attachment_id = "tgw-attach-YYY"
  non_prod_staging_attachment_id = "tgw-attach-ZZZ"

}