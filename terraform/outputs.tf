output "private_key" {
  value     = tls_private_key.tls_private_key.private_key_pem
  sensitive = true
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}