resource "aws_s3_bucket" "this" {
  bucket_prefix = "monorepo-"
}

resource "aws_s3_bucket" "that" {
  bucket_prefix = "monorepo-"
}
