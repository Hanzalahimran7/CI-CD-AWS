## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.terraform_apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codebuild_project.terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_codestarnotifications_notification_rule.commits](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarnotifications_notification_rule) | resource |
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.terraform_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.terraform_plan_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.terrafor_validate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name | `string` | n/a | yes |
| <a name="input_code_build_apply_name"></a> [code\_build\_apply\_name](#input\_code\_build\_apply\_name) | CodeBuild name for apply stage | `string` | n/a | yes |
| <a name="input_code_build_plan_name"></a> [code\_build\_plan\_name](#input\_code\_build\_plan\_name) | CodeBuild name for plan stage | `string` | n/a | yes |
| <a name="input_code_pipeline_name"></a> [code\_pipeline\_name](#input\_code\_pipeline\_name) | CodePipeline name | `string` | n/a | yes |
| <a name="input_codepipeline-policy-name"></a> [codepipeline-policy-name](#input\_codepipeline-policy-name) | CodePipeline IAM policy name | `string` | n/a | yes |
| <a name="input_codepipeline-role-name"></a> [codepipeline-role-name](#input\_codepipeline-role-name) | CodePipeline IAM role name | `string` | n/a | yes |
| <a name="input_dynamo_db_name"></a> [dynamo\_db\_name](#input\_dynamo\_db\_name) | DynamoDB name for state lock | `string` | n/a | yes |
| <a name="input_notification_rule_name"></a> [notification\_rule\_name](#input\_notification\_rule\_name) | Notification rule name | `string` | n/a | yes |
| <a name="input_sns_endpoint"></a> [sns\_endpoint](#input\_sns\_endpoint) | Email where notification is to be sent | `string` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | SNS topic name | `string` | n/a | yes |
| <a name="input_terraform-plan-role-name"></a> [terraform-plan-role-name](#input\_terraform-plan-role-name) | Terraform plan IAM role name | `string` | n/a | yes |

## Outputs

No outputs.
