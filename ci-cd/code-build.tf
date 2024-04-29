resource "aws_codebuild_project" "terraform_plan" {
  name         = "terraform-plan-hanzalah-demo"
  service_role = aws_iam_role.terraform_plan.arn
  artifacts {
    type = "CODEPIPELINE"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:latest"
    type         = "LINUX_CONTAINER"
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec-plan.yml"
  }
}

resource "aws_codebuild_project" "terraform_apply" {
  name         = "terraform-apply-hanzalah-demo"
  service_role = aws_iam_role.terraform_plan.arn
  artifacts {
    type = "CODEPIPELINE"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "hashicorp/terraform:latest"
    type         = "LINUX_CONTAINER"
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec-apply.yml"
  }
}
