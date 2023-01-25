resource "aws_s3_bucket" "this" {
  bucket_prefix = "monorepo-"
}

resource "aws_s3_bucket" "test2" {
  bucket_prefix = "monorepo-"
}
