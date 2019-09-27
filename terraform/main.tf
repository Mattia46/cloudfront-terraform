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
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "second-obj" {
    bucket       = "${aws_s3_bucket.b.id}"
    key          = var.second
    source       = var.second_path
    etag         = "${filemd5(var.second_path)}"
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "style-obj" {
    bucket       = "${aws_s3_bucket.b.id}"
    key          = var.style
    source       = var.style_path
    etag         = "${filemd5(var.style_path)}"
    content_type = "text/css"
}


resource "aws_cloudfront_distribution" "cf_s3_distribution" {
    origin {
        domain_name = "${aws_s3_bucket.b.bucket_regional_domain_name}"
        origin_id   = var.s3_origin_id

    s3_origin_config {
            origin_access_identity = var.origin_access_identity
        }
    }

    enabled             = true
    is_ipv6_enabled     = true
    comment             = "Main CF distro with S3"
    default_root_object = "main.html"

    default_cache_behavior {
      allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
      cached_methods   = ["GET", "HEAD"]
      target_origin_id = var.s3_origin_id

      forwarded_values {
        query_string = false

        cookies {
          forward = "none"
        }
      }

      viewer_protocol_policy = "allow-all"
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    viewer_certificate {
      cloudfront_default_certificate = true
    }
}
