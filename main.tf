terraform {
   backend "s3" {
    bucket = "ACCOUNT_ID-terraform-states"
    region = "us-east-1"
    key    = "terraform.tfstate"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.9.1"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  tags = {
    Name = "Test_server"
  }
}
