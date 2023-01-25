resource "aws_s3_bucket" "this" {
  bucket_prefix = "monorepo-"
}

resource "aws_s3_bucket" "test" {
  bucket_prefix = "monorepo-"
}
