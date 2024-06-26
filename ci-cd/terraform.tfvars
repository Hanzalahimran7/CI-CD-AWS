aws_region               = "eu-west-1"
sns_endpoint             = "hanzalah@xgrid.co"
sns_topic_name           = "s215-demo-sns"
notification_rule_name   = "sns-notification-rule-s215"
bucket_name              = "s215-hanzalah-demo"
terraform-plan-role-name = "s215-hanzalah-tf-plan"
codepipeline-policy-name = "s215-codepipeline-iam-policy"
codepipeline-role-name   = "s215-codepipeline-iam-role"
dynamo_db_name           = "s215-terraform-state-lock"
code_pipeline_name       = "s215-hanzalah"
code_build_apply_name    = "s215-terraform-apply-stage"
code_build_plan_name     = "s215-terraform-plan-stage"
