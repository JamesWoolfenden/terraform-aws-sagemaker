
resource "aws_iam_role" "examplea" {
  name_prefix = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = var.common_tags
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

resource "aws_iam_role_policy" "examplea" {
  name = "test_policy"
  role = aws_iam_role.examplea.id


  policy = var.policy
}

