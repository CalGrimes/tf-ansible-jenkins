output "instance_key" {
    description = "Key to access the EC2 instance"
    output      = "EC2 Access Key File Saved: ${aws_s3_bucket.s3_key_bucket.bucket}/${aws_key_pair.keypair_cgrim.key_name}.pub"
}