variable "dynamo_db_name" {
  type = string
  description = "Name of the Dynamo! DB"
}

variable "hash_key" {
  type = string
  description = "Primary key for the Dynamo DB"
}

variable "dynamo_read_capacity" {
  type = number
  description = "Read capacity for the Dynamo DB"
}

variable "dynamo_write_capacity" {
  type = number
  description = "Write capacity for the Dynamo DB"
}

variable "lambda_func_name" {
    type = string
  description = "Name of the Lambda function"
}

variable "timeout" {
  type = number
  description = "Timeout for the Lambda function"
}

variable "lambda_policy_name" {
    type = string
  description = "Name of the Lambda IAM policy"
}

variable "lambda_role_name" {
    type = string
  description = "Name of the Lambda   IAM role"
}

variable "aws_region" {
    type = string
  description = "AWS Region"
}
