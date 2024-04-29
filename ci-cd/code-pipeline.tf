

resource "aws_codestarconnections_connection" "this" {
  name          = "s215-hanzalah"
  provider_type = "GitHub"
}

resource "aws_codepipeline" "codepipeline" {
  name = var.code_pipeline_name
  artifact_store {
    location = aws_s3_bucket.this.bucket
    type     = "S3"
  }
  role_arn = aws_iam_role.codepipeline_role.arn
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["CodeWorkspace"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.this.arn
        FullRepositoryId = "hanzalah-xgrid/demo-s215"
        BranchName       = "main"
      }
    }
  }
  stage {
    name = "Plan"

    action {
      run_order        = 1
      name             = "Terraform-Plan"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["CodeWorkspace"]
      output_artifacts = []
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.terraform_plan.name
        EnvironmentVariables = jsonencode([
          {
            name  = "AWS_REGION"
            value = var.aws_region
            type  = "PLAINTEXT"
          },
          {
            name  = "BUCKET_NAME"
            value = var.bucket_name
            type  = "PLAINTEXT"
          },
          {
            name  = "DYNAMO_DB_NAME"
            value = var.dynamo_db_name
            type  = "PLAINTEXT"
          }
        ])
      }
    }
  }

  stage {
    name = "Apply"
    action {
      run_order        = 1
      name             = "Terraform-Apply"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["CodeWorkspace"]
      output_artifacts = []
      version          = "1"
      configuration = {
        ProjectName   = aws_codebuild_project.terraform_apply.name
        PrimarySource = "CodeWorkspace"
        EnvironmentVariables = jsonencode([
          {
            name  = "AWS_REGION"
            value = var.aws_region
            type  = "PLAINTEXT"
          },
          {
            name  = "BUCKET_NAME"
            value = var.bucket_name
            type  = "PLAINTEXT"
          },
          {
            name  = "DYNAMO_DB_NAME"
            value = var.dynamo_db_name
            type  = "PLAINTEXT"
          }
        ])
      }
    }

  }
}
