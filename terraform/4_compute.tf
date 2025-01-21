resource "aws_key_pair" "keypair_cgrim" {
  key_name   = "jenkins_instance_key"
  public_key = tls_private_key.tls_private_key.public_key_openssh
}

resource "local_file" "public_key_cgrim" {
  content  = aws_key_pair.keypair_cgrim.public_key
  filename = "${path.module}/jenkins_instance_key.pub"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"

  instance_type         = var.instance_type
  key_name              = aws_key_pair.keypair_cgrim.key_name
  subnet_id             = aws_subnet.sn_cgrim.id
  vpc_security_group_ids = [aws_security_group.sg_cgrim.id]
  name                  = concat(var.prefix, "_jenkins_instance")
  my_aws_key            = aws_key_pair.keypair_cgrim.key_name
}