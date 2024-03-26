terraform {
  backend "s3" {
    bucket = "cicd-tf-eks-tamer"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
