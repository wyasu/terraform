terraform {
  backend "s3" {
    bucket = "udemy-terraform-902041209833-ap-northeast-1"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-1"
  }
}