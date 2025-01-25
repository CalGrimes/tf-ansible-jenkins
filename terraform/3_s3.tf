resource "aws_s3_bucket" "s3_key_bucket" {
  bucket = "${var.prefix}-instance-key"
  tags = {
    Name        = "${var.prefix}-instance-key"
    Environment = "Dev"
  }
}