module "server_logs_bucket" {
  source = "./features/S3"
}

module "kinesis_firehose_server_logs" {
  source = "./features/kinesis_firehose_server_logs"

  s3_bucket_arn  = module.server_logs_bucket.s3_bucket_arn
  s3_bucket_name = module.server_logs_bucket.s3_bucket_name
}