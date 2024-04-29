resource "aws_iam_policy_document" "this" {
  statement {
    actions = ["dynamodb:PutItem"]
    resources = [aws_dynamodb_table.this.arn]
    effect = "Allow"
  }
  statement {
    actions = [
      "elasticloadbalancing:DescribeLoadBalancers",
      "ec2:DescribeInstances",
      "tag:GetResources",
      "s3:ListAllMyBuckets",
      "tag:GetTagValues",
      "tag:GetTagKeys",
      "ec2:DescribeSecurityGroups"
    ]
    resources = ["*"]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "this" {
  name        = var.lambda_policy_name
  path        = "/"
  description = "Policy containing necessary permissions"
  policy = aws_iam_policy_document.this.json
}

resource "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name = var.lambda_role_name

  assume_role_policy = aws_iam_policy_document.assume_role.json
  managed_policy_arns = [aws_iam_policy.this.arn]
}
