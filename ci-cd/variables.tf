variable "aws_region" {
  default     = "eu-west-1"
  description = "AWS region"
  type        = string
}

variable "sns_topic_name" {
  description = "SNS topic name"
  type        = string
  default = "terraform-state-change-notification-s215"
}

variable "sns_endpoint" {
  description = "Email where notification is to be sent"
  type        = string
  default = "hanzalah@xgrid.co"
}

variable "notification_rule_name" {
  description = "Notification rule name"
  type        = string
  default = "terraform-state-change-notification-s215"
}

variable "bucket_name" {
  description = "Bucket name"
  type        = string
  default = "terraform-state-s215"
}

variable "terraform-plan-role-name" {
  description = "Terraform plan IAM role name"
  type        = string
  default = "terraform-plan-role-s215"
}

variable "codepipeline-role-name" {
  description = "CodePipeline IAM role name"
  type        = string
  default = "codepipeline-role-s215"
}

variable "codepipeline-policy-name" {
  description = "CodePipeline IAM policy name"
  type        = string
  default = "codepipeline-policy-s215"
}

variable "dynamo_db_name" {
  description = "DynamoDB name for state lock"
  type        = string
  default = "terraform-state-lock-s215"
}

variable "code_pipeline_name" {
  description = "CodePipeline name"
  type        = string
  default = "terraform-state-s215"
}

variable "code_build_plan_name" {
  description = "CodeBuild name for plan stage"
  type        = string
  default = "terraform-plan-s215"
}

variable "code_build_apply_name" {
  description = "CodeBuild name for apply stage"
  type        = string
  default =   "terraform-apply-s215"
}