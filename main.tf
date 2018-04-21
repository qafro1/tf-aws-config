provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_iam_role" "newforce" {
  name = "aws-config-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "newforce_attach" {
  role       = "${aws_iam_role.newforce.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_role_policy" "newforce_policy" {
  name = "aws-config-role"
  role = "${aws_iam_role.newforce.name}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.site_bucket.arn}",
        "${aws_s3_bucket.site_bucket.arn}/*"
      ]
    }
  ]
}
POLICY
}
