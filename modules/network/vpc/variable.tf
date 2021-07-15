variable "vpc_cidr" {
  type = string
}

variable "subnets_cidr_newbits" {
  type = number
  default = 4
}

variable "net_subnets_cidr_newbits" {
  type = number
  default = 8
}

variable "availability_zones_count" {
  type = number
  default = 2
}

variable "name_prefix" {
  type = string
}

variable "transit_gateway_id" {
  type = string
}