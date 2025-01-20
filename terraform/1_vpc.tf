resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    name        = "${var.prefix}-vpc-${var.region}"
    environment = "Dev"
  }
}