terraform {
  backend "s3" {
    bucket         = "cgrim-dev-s3-tfstate"
    key            = "terraform/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock-table"
  }
}