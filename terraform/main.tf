provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["621041455573"]
}

resource "aws_s3_bucket" "b" {
  bucket = "mattia-bucket"
  acl    = "private"
}

resource "aws_s3_bucket_object" "main-obj" {
    bucket       = "${aws_s3_bucket.b.id}"
    key          = var.main
    source       = var.main_path
    etag         = "${filemd5(var.main_path)}"
    content-type = "text/html"
}

resource "aws_s3_bucket_object" "second-obj" {
    bucket       = "${aws_s3_bucket.b.id}"
    key          = var.second
    source       = var.second_path
    etag         = "${filemd5(var.second_path)}"
    content-type = "text/html"
}

resource "aws_s3_bucket_object" "style-obj" {
    bucket       = "${aws_s3_bucket.b.id}"
    key          = var.style
    source       = var.style_path
    etag         = "${filemd5(var.style_path)}"
    content-type = "text/css"
}
