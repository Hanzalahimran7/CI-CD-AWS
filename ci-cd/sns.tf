
resource "aws_sns_topic" "this" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn              = aws_sns_topic.this.arn
  protocol               = "email"
  endpoint               = var.sns_endpoint
  endpoint_auto_confirms = true
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sns:Publish"]

    principals {
      type        = "Service"
      identifiers = ["codestar-notifications.amazonaws.com"]
    }

    resources = [aws_sns_topic.this.arn]
  }
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.this.arn
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_codestarnotifications_notification_rule" "commits" {
  detail_type    = "BASIC"
  event_type_ids = ["codepipeline-pipeline-pipeline-execution-succeeded"]

  name     = var.notification_rule_name
  resource = aws_codepipeline.codepipeline.arn

  target {
    address = aws_sns_topic.this.arn
  }
}
