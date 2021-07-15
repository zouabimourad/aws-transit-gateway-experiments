data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  availability_zones_count = 2

  letters = ["a", "b", "c"]

}
