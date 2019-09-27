provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["621041455573"] # dazn-demo-one
}

resource "aws_s3_bucket" "b" {
  bucket = "mattia-bucket"
  acl    = "private"
}

resource "aws_s3_bucket_object" "main-obj" {
    bucket = var.main
    key    = var.main
    source = var.main_path
    etag   = "${filemd5(var.main_path)}"
}

resource "aws_s3_bucket_object" "second-obj" {
    bucket = var.second
    key    = var.second
    source = var.second_path
    etag   = "${filemd5(var.second_path)}"
}

resource "aws_s3_bucket_object" "style-obj" {
    bucket = var.style
    key    = var.style
    source = var.style_path
    etag   = "${filemd5(var.style_path)}"
}
