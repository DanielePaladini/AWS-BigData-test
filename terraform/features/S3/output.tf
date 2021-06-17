output "s3_bucket_arn" {
  value = aws_s3_bucket.server_logs_bucket.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.server_logs_bucket.bucket
}