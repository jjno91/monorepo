resource "aws_s3_bucket" "this" {
  bucket_prefix = "monorepo-"
}

resource "aws_s3_bucket" "another" {
  bucket_prefix = "monorepo-"
}
