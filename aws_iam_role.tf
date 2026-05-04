
resource "aws_iam_role" "examplea" {
  name_prefix        = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.common_tags
}

data "aws_iam_policy_document" "assume_role" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "examplea" {
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  name = "test_policy"
  role = aws_iam_role.examplea.id


  policy = var.policy
}
