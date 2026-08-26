#  Provider
provider "aws" {
  region = "eu-west-1" # change region as needed 
}


#  S3 Bucket
resource "aws_s3_bucket" "static_site" {
  bucket = "sharif-static-site-hb2026" # make bucket name unique
}

# S3 Remove Public Access Block
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#  S3 Bucket Policy
resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid: "PublicReadGetObject",
        Effect = "Allow",
        Principal = "*",
        Action = ["s3:PutObject", "s3:GetObject", "s3:ListBucket"],
        Resource = "arn:aws:s3:::${aws_s3_bucket.static_site.id}/*"
      }
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.public_access_block]
}

# S3 Bucket Website Configuration
resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.static_site.id
  index_document {
    suffix = "index.html"
  }
}