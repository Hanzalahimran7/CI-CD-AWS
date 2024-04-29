resource "aws_lambda_function" "this" {
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_func_name
  role          = aws_iam_role.this.arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python3.12"
  timeout = var.timeout
  environment {
    variables = {
      table_name = var.dynamo_db_name
      hash_key = var.hash_key
    }
  }
}
