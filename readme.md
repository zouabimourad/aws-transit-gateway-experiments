# AWS transit gateway experiments

# Introduction

The purpose of these terraform/terragrunt scripts is to implement Transit Gateway Architecture presented in the following links :

https://aws.amazon.com/blogs/networking-and-content-delivery/building-an-egress-vpc-with-aws-transit-gateway-and-the-aws-cdk/

# Perquisites

- Terraform
- Terragrunt

3 Accouns accounts :

- non-prod
- prod ( optional )
- service

# Configuration

# .hcl files

Please configure the following files according to your AWS Accounts settings

account.hcl
region.hcl
env.hcl

# variable.tf

Please configure variable.tf according to your AWS Accounts settings and with entities ids

# Running

## Transit Gateway

`cd global/account-service/eu-west-1/shared/network/transit-gateway`

`terragrunt apply`

## Egress VPC

`cd global/account-service/eu-west-1/shared/network/egress-vpc`

`terragrunt apply`

## One or more VPC ( dev for example )

`cd global/account-non-prod/eu-west-1/shared/network/dev/vpc`

`terragrunt apply`

## Transit Gateway Route Table

`cd global/account-service/eu-west-1/shared/network/transit-gateway-route-table`

`terragrunt apply`