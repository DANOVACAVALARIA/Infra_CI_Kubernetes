terraform {
  backend "s3" {
    bucket = "alura-k8s"
    key    = "Prod/terraform.tfstate"
    region = "us-west-2"
  }
}