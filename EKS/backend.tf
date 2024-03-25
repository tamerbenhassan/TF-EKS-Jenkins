terraform {
  backend "s3" {
    bucket = "cicd-tf-eks-tamer"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
