variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "endpoint" {
  type = object({
    name = string
    variant = list(object({
      name  = string
      count = number
      type  = string
    }))
  })
  description = "Endpoint settings"
  default = {
    name = "my-endpoint-config"
    variant = [{
      count = 1
      name  = "variant-1"
      type  = "ml.t2.medium"
    }]
  }

}

variable "role_name" {
  type    = string
  default = "sagemaker"
}

variable "policy" {
  type        = string
  description = "Least privilege policy"
}
