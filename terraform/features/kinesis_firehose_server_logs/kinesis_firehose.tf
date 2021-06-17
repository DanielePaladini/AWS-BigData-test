resource "aws_kinesis_firehose_delivery_stream" "server_logs_ingestion" {
  name        = "server_logs_ingestion"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.kinesis_server_logs_role.arn
    bucket_arn = var.s3_bucket_arn
  }
}
