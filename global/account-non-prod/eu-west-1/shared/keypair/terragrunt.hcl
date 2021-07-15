locals {

  # Automatically load environment-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Extract out common variables for reuse
  account_code = local.account_vars.locals.aws_account_code

}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../../modules/keypair"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

//
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  key_name = "${local.account_code}-default"
  public_key = "ssh-rsa XXX" // Replace public key
}