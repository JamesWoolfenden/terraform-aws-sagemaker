module "sagemaker" {
  source      = "../../"
  common_tags = var.common_tags
  policy      = data.aws_iam_policy_document.sagemaker.json
}

data "aws_iam_policy_document" "sagemaker" {
  #checkov:skip=CKV_AWS_109:example only
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["sagemaker.amazonaws.com"]
    }

  }
  #checkov:skip=CKV_AWS_111:illustration only
  statement {
    effect = "Allow"
    actions = [
      "sagemaker:DescribeEndpointConfig",
      "sagemaker:DescribeModel",
      "sagemaker:InvokeEndpoint",
      "sagemaker:ListTags",
      "sagemaker:DescribeEndpoint",
      "sagemaker:CreateModel",
      "sagemaker:CreateEndpointConfig",
      "sagemaker:CreateEndpoint",
      "sagemaker:DeleteModel",
      "sagemaker:DeleteEndpointConfig",
      "sagemaker:DeleteEndpoint",
      "cloudwatch:PutMetricData",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
      "logs:DescribeLogStreams",
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket",
    ]
    resources = var.bucketlist
  }
}

variable "bucketlist" {
  type    = list(string)
  default = ["arn:aws:s3:::bucket_name/*", "arn:aws:s3:::bucket_name"]
}
