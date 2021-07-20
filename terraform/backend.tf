terraform {
  backend "remote" {
    organization = "samdowney"

    workspaces {
      name = "microservices"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

variable "region" {
  default = "ap-southeast-2"
}

variable "aws_access_key" {
  description = "The AWS access key."
}

variable "aws_secret_key" {
  description = "The AWS secret key."
}