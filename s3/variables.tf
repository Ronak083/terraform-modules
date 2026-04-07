variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "cloudfront_distribution_arns" {
  description = "List of CloudFront distribution ARNs allowed to access this bucket. Provide the full ARN e.g., [\"arn:aws:cloudfront::300545976125:distribution/E1A2B3C4D5E6F7\"]"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}
