/**
* template_file
*/
data "template_file" "required_tags" {
  template = "${file("${path.module}/tags/required_tags.tpl")}"

  vars = {}
}

/**
 * AWS Config Rules
 */

resource "aws_config_config_rule" "cloudtrail_enabled" {
  name = "${var.cloudtrail}"

  source {
    owner             = "AWS"
    source_identifier = "CLOUD_TRAIL_ENABLED"
  }

  depends_on = ["aws_config_configuration_recorder.newforce"]
}

resource "aws_config_config_rule" "eip_attached" {
  name = "${var.EIchecker}"

  source {
    owner             = "AWS"
    source_identifier = "EIP_ATTACHED"
  }

  depends_on = ["aws_config_configuration_recorder.newforce"]
}

resource "aws_config_config_rule" "EBSvolumes" {
  name = "${var.EBSvolumes}"

  source {
    owner             = "AWS"
    source_identifier = "EC2_VOLUME_INUSE_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.newforce"]
}

resource "aws_config_config_rule" "mfa_enabled" {
  name = "${var.mfa-enabled}"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  depends_on = ["aws_config_configuration_recorder.newforce"]
}

resource "aws_config_config_rule" "encrypted-volumes" {
  name = "${var.encrypted-volumes}"

  source {
    owner             = "AWS"
    source_identifier = "ENCRYPTED_VOLUMES"
  }

  depends_on = ["aws_config_configuration_recorder.newforce"]
}

/**
resource "aws_config_config_rule" "required-tags" {
  name             = "${var.required-tags}"
  input_parameters = "${data.template_file.required_tags.rendered}"

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }

  depends_on = ["aws_config_configuration_recorder.newforce"]
}
*/
/** 
* Utilizing the input_parameters property for rule 'Properties' works for AWS Managed rules as long as the json is 'string' based.

resource "aws_config_config_rule" "managed-rule-01" {
  name = "REQUIRED_TAGS"

  #Convert this to a list later
  input_parameters = "{\"tag1Key\": \"Name\",\"tag2Key\": \"Description\",\"tag3Key\": \"BudgetCode\",\"tag4Key\": \"Owner\"}"

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }
}

*/

