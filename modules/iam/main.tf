# IAM policy configuration
# Create an IAM Policy for RDS access
resource "aws_iam_policy" "allow_rds_connect" {
  name = "AllowRDSConnectPolicy"
  role = aws_iam_role.application_iam_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "rds-db:connect"
        Resource = var.rds_db_arn
      }
    ]
  })
}

# Attach the policy to the application role
resource "aws_iam_policy_attachment" "attach_rds_policy" {
  role       = var.application_iam_role
  policy_arn = aws_iam_policy.allow_rds_connect.arn
}

resource "aws_iam_role" "application_iam_role" {
  name               = "example-app-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}

