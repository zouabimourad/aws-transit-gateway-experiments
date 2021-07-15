variable "vpc_cidr" {
  type = string
  default = "10.1.0.0/16"
}

variable "subnets_cidr_newbits" {
  type = number
  default = 4
}

variable "name_prefix" {
  type = string
}

variable "transit_gateway_id" {
  type = string
}


variable "peer_vpc_cidrs" {
  type = list(string)
}

variable "bastion_ami" {
  type = string
}

variable "bastion_instance_type" {
  type = string
}

variable "bastion_key_name" {
  type = string
}