variable "bucket_count" {
  type        = number
  description = "The number of buckets to create (varies by workspace)."
  default = 0
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  count  = var.bucket_count
  bucket = "luna-assets-${count.index + 1}-${terraform.workspace}-${random_id.bucket_suffix.hex}"
}