data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2_cgrim" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids

  tags = {
    Name = "${var.name}"
  }
}

resource "aws_eip" "eip_cgrim" {
  instance = aws_instance.ec2_cgrim.id
}

resource "aws_eip_association" "eip_assoc_cgrim" {
  instance_id   = aws_instance.ec2_cgrim.id
  allocation_id = aws_eip.eip_cgrim.id
}
