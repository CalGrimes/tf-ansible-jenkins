data "http" "my_ip" {
  url = "http://checkip.amazonaws.com/"
}

locals {
  runner_ip = chomp(data.http.my_ip.response_body)
}

resource "aws_security_group" "sg_cgrim" {
  name = "${var.prefix}-security-group"

  vpc_id = aws_vpc.vpc_cgrim.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip, "${local.runner_ip}/32"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.my_ip, "${local.runner_ip}/32"]
  }

  ingress {
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = [var.my_ip, "${local.runner_ip}/32"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name = "${var.prefix}-security-group"
  }
}