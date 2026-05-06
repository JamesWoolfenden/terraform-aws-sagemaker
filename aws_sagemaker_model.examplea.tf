resource "aws_sagemaker_model" "examplea" {
  enable_network_isolation = true
  execution_role_arn       = aws_iam_role.examplea.arn
  tags                     = var.common_tags
}
