resource "aws_sagemaker_model" "examplea" {
  execution_role_arn = aws_iam_role.examplea.arn
}

resource "aws_iam_role" "examplea" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}