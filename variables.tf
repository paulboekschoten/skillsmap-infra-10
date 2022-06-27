variable "name_tag" {
  description = "global name for resource tags"
  type        = string
  default     = "paul-skillsmap-10-tf"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR of the VPC"
  type        = string
  default     = "10.1.0.0/16"
}