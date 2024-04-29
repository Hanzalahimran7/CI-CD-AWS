terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40.0"
    }
  }
}

provider "aws" {
  region = "AWS_REGION_HERE"
}


terraform {
  backend "s3" {
    bucket = "BUCKET_NAME_HERE"
    key    = "cicd/state"
    region = "AWS_REGION_HERE"
    dynamodb_table = "DYNAMO_DB_NAME_HERE"
  }
}
