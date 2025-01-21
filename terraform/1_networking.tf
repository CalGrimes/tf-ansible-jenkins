resource "aws_vpc" "vpc_cgrim" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.prefix}-vpc-${var.region}"
    environment = "Dev"
  }
}

resource "aws_subnet" "sn_cgrim" {
  vpc_id     = aws_vpc.vpc_cgrim.id
  cidr_block = "10.0.10.0/24"

  tags = {
    Name = "${var.prefix}-subnet"
  }
}

resource "aws_internet_gateway" "ig_cgrim" {
  vpc_id = aws_vpc.vpc_cgrim.id

  tags = {
    Name = "${var.prefix}-internet-gateway"
  }
}

resource "aws_route_table" "rt_cgrim" {
  vpc_id = aws_vpc.vpc_cgrim.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_cgrim.id
  }
}

resource "aws_route_table_association" "tra_cgrim" {
  subnet_id      = aws_subnet.sn_cgrim.id
  route_table_id = aws_route_table.rt_cgrim.id
}
