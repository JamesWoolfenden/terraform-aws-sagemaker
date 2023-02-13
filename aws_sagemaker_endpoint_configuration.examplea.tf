resource "aws_sagemaker_endpoint_configuration" "examplea" {
  name        = var.endpoint.name
  kms_key_arn = aws_kms_key.examplea.arn

  dynamic "production_variants" {
    for_each = var.endpoint.variant
    content {
      variant_name           = production_variants.value["name"]
      model_name             = aws_sagemaker_model.examplea.name
      initial_instance_count = production_variants.value["count"]
      instance_type          = production_variants.value["type"]
    }
  }
  tags = var.common_tags
}

resource "aws_kms_key" "examplea" {
  enable_key_rotation = true
  tags                = var.common_tags
}
