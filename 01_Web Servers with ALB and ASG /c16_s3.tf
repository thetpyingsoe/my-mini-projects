resource "random_id" "bucket-name" {
  byte_length = 8
}
resource "aws_s3_bucket" "tps" {
  bucket = "mybucket-${random_id.bucket-name.dec}"

  tags = {
    Name        = "my bucket"
    Environment = "PRD"
  }
}
#Configure the bucket to allow public read access
/*resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.tps.id
  acl    = "public-read"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}
# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.tps.id
  rule {
    object_ownership = "ObjectWriter"
  }
}*/
#Create an S3 bucket policy that allows read-only access to a specific IAM user or role.
resource "aws_s3_bucket_policy" "allow_access_s3" {
  bucket = aws_s3_bucket.tps.id
  policy = data.aws_iam_policy_document.allow_access_read.json
}

data "aws_iam_policy_document" "allow_access_read" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["488206698161"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.tps.arn,
      "${aws_s3_bucket.tps.arn}/*",
    ]
  }
}