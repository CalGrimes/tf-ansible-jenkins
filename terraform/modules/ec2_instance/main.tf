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
  key_name                    = aws_key_pair.keypair_cgrim.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.sn_cgrim.id
  vpc_security_group_ids      = [aws_security_group.sg_cgrim.id]

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
