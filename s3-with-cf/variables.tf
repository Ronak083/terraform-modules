variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "domain_name" {
  description = "The custom domain name to attach to the CloudFront distribution (e.g., app.example.com)."
  type        = string
  default     = ""
}

variable "hosted_zone_name" {
  description = "The Route 53 Hosted Zone name where the DNS record will be created (e.g., example.com). Required if domain_name is provided."
  type        = string
  default     = ""
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate to use for the custom domain in CloudFront (must be in us-east-1). Required if domain_name is provided."
  type        = string
  default     = ""
}
