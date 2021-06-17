terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    # Centralized terraform states and dynamoDB table
    profile              = "dev-personal"
    bucket               = "aws-bigdata-project-test"
    dynamodb_table       = "aws-bigdata-project-terraform-state-lock"
    region               = "eu-west-1"
    workspace_key_prefix = "aws-data-analytic"
    key                  = "bigdata-project"
  }

  # S3 remote state path: <bucket-name>/<workspace_key_prefix>/<terraform_workspace>/<key>
  #                       <bucket-name>/<project>/<environment>/<sub-project>
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
  profile = "dev-personal"
}