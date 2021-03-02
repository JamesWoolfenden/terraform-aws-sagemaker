resource "aws_sagemaker_endpoint_configuration" "examplea" {
  name        = "my-endpoint-config"
  kms_key_arn = aws_kms_key.examplea.arn

  production_variants {
    variant_name           = "variant-1"
    model_name             = aws_sagemaker_model.examplea.name
    initial_instance_count = 1
    instance_type          = "ml.t2.medium"
  }

  tags = var.common_tags
}

resource "aws_kms_key" "examplea" {
  enable_key_rotation = true
}
