terraform {
  backend "s3" {
    bucket         = "cgrim-s3-tfstate"
    key            = "terraform/state"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock-table"
  }
}