data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  letters = ["a", "b", "c"]
}