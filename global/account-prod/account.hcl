# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  aws_account_code = "prod"
  aws_account_id = "XXXXXXXXXXXX"
}