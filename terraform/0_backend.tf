terraform {
  backend "s3" {
    bucket         = "cgrim-tfstate"
    key            = "terraform/state"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock-table"
  }
}