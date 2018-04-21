variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-2"
}

variable "s3_bucket_name" {
  description = "The S3 bucket name for AWS Config logs."
  type        = "string"
  default     = "config-s3"
}

variable "s3_key_prefix" {
  description = "The S3 prefix for AWS Config logs."
  default     = "config-s3-prefix"
  type        = "string"
}

variable "config_delivery_frequency" {
  description = "The frequency with which AWS Config delivers configuration snapshots."
  default     = "Six_Hours"
  type        = "string"
}

variable "name" {
  description = " The AWSconfig name"
  default     = "aws-config-dev"
}

variable "cloudtrail" {
  description = "The AWS config rule to Ensure CloudTrail is enabled"
  type        = "string"
  default     = "cloudtrail-enabled"
}

variable "config_max_execution_frequency" {
  description = "The maximum frequency with which AWS Config runs evaluations for a rule."
  default     = "TwentyFour_Hours"
  type        = "string"
}

variable "EIchecker" {
  description = "Checks whether all EIP addresses allocated to a VPC are attached to EC2 instances."
  default     = "eip-attached"
  type        = "string"
}

variable "EBSvolumes" {
  description = "Checks whether EBS volumes are attached to EC2 instances"
  default     = "ec2-volume-inuse-check"
  type        = "string"
}

variable "mfa-enabled" {
  description = "Checks whether the root user of your AWS account requires multi-factor authentication for console sign-in."
  default     = "root-account-mfa-enabled"
  type        = "string"
}

/**
variable "required-tags" {
  description = "Checks whether your resources have the tags that you specify."
  default     = "required-tags"
  type        = "string"
}
*/
variable "encrypted-volumes" {
  description = "Checks whether EBS volumes that are in an attached state are encrypted."
  default     = "encrypted-volumes"
  type        = "string"
}
