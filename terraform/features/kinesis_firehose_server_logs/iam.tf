resource "aws_iam_role" "kinesis_server_logs_role" {
  name               = "kinesis_server_logs_role"
  assume_role_policy = data.aws_iam_policy_document.kinesis_server_logs_trust_relationships.json
}

data "aws_iam_policy_document" "kinesis_server_logs_trust_relationships" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["firehose.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role_policy" "kinesis_server_logs_permission_policy" {
  name   = "kinesis_server_logs_policy"
  policy = data.aws_iam_policy_document.kinesis_server_logs_permissions.json
  role   = aws_iam_role.kinesis_server_logs_role.id
}

data "aws_iam_policy_document" "kinesis_server_logs_permissions" {

  statement {
    effect = "Allow"
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
      "arn:aws:s3:::${var.s3_bucket_name}/*"
    ]
  }

}