## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.4.2 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [archive_file.this](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_dynamo_db_name"></a> [dynamo\_db\_name](#input\_dynamo\_db\_name) | Name of the Dynamo DB | `string` | n/a | yes |
| <a name="input_dynamo_read_capacity"></a> [dynamo\_read\_capacity](#input\_dynamo\_read\_capacity) | Read capacity for the Dynamo DB | `number` | n/a | yes |
| <a name="input_dynamo_write_capacity"></a> [dynamo\_write\_capacity](#input\_dynamo\_write\_capacity) | Write capacity for the Dynamo DB | `number` | n/a | yes |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | Primary key for the Dynamo DB | `string` | n/a | yes |
| <a name="input_lambda_func_name"></a> [lambda\_func\_name](#input\_lambda\_func\_name) | Name of the Lambda function | `string` | n/a | yes |
| <a name="input_lambda_policy_name"></a> [lambda\_policy\_name](#input\_lambda\_policy\_name) | Name of the Lambda IAM policy | `string` | n/a | yes |
| <a name="input_lambda_role_name"></a> [lambda\_role\_name](#input\_lambda\_role\_name) | Name of the Lambda IAM role | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout for the Lambda function | `number` | n/a | yes |

## Outputs

No outputs.
