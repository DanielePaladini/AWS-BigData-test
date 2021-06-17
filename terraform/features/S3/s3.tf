resource "aws_s3_bucket" "server_logs_bucket" {
  bucket = "aws-bigdata-project-server-logs"
  acl    = "private"

  force_destroy = true

  tags = {
    Name        = "server_logs_bucket"
    Environment = "Dev"
  }
}