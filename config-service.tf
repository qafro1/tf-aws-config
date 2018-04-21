/**
 * AWS Config Service
 */

resource "aws_s3_bucket" "site_bucket" {
  bucket        = "${var.s3_bucket_name}"
  force_destroy = true
}

resource "aws_config_configuration_recorder" "newforce" {
  name     = "${var.name}"
  role_arn = "${aws_iam_role.newforce.arn}"

  recording_group = {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "newforce" {
  name           = "${var.name}"
  s3_bucket_name = "${aws_s3_bucket.site_bucket.bucket}"
  s3_key_prefix  = "${var.s3_key_prefix}"

  snapshot_delivery_properties = {
    delivery_frequency = "${var.config_delivery_frequency}"
  }

  depends_on = ["aws_config_configuration_recorder.newforce"]
}

resource "aws_config_configuration_recorder_status" "newforce" {
  name       = "${var.name}"
  is_enabled = true
  depends_on = ["aws_config_delivery_channel.newforce"]
}
