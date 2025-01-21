output "instance_id" {
  description = "The ID of the instance."
  value       = aws_instance.ec2_cgrim.id
}

output "public_ip" {
  description = "The public IP of the instance."
  value       = aws_eip.eip_cgrim.public_ip
}