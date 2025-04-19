# Create IAM role for EC2 instance
resource "aws_iam_role" "ec2_role" {
  name = "EC2_SSM_Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach AmazonSSMManagedInstanceCore policy to the IAM role
resource "aws_iam_role_policy_attachment" "ec2_role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.ec2_role.name
}

# Create an instance profile for the EC2 instance and associate the IAM role
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "EC2_SSM_Instance_Profile"
  role = aws_iam_role.ec2_role.name
}
resource "aws_iam_policy" "access2s3" {
  name        = "access2s3"
  description = "Example policy"
  policy      = jsonencode({
  Version    = "2012-10-17"
  
  Statement = [
      {
        Action   = ["s3:ListBucket"]
        Effect   = "Allow"
        Resource = [aws_s3_bucket.tps.arn]
      },
      {
        Action   = ["s3:GetObject", "s3:PutObject"]
        Effect   = "Allow"
        Resource = ["${aws_s3_bucket.tps.arn}/*"]
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "access2s3policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.access2s3.arn
}
