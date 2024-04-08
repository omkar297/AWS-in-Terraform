terraform {
  backend "s3" {
    bucket = "test-terraform-state-file-storage-08042024"
    region = "ap-south-1"
    key = "log/terraform.tfstate"
  }
}