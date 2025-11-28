variable "default_tags" {
  type        = map(string)
  description = "Default resource tags"
  default = {
    "product"     = "antonella"
    "environment" = "test"
  }
}