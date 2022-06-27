# used for naming and tagging resources
variable "name_tag" {
  description = "global name for resource tags"
  type        = string
  default     = "paul-skillsmap-10-tf"
}

# region
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

# vpc cidr block
variable "vpc_cidr" {
  description = "CIDR of the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

# subnet cidr blocks
variable "subnet_private" {
  description = "private subnet cidr"
  type        = string
  default     = "10.1.0.0/24"
}

variable "subnet_public1" {
  description = "public1 subnet cidr"
  type        = string
  default     = "10.1.1.0/24"
}

variable "subnet_public2" {
  description = "public2 subnet cidr"
  type        = string
  default     = "10.1.2.0/24"
}

# default http port
variable "http_port" {
  description = "http port"
  type        = number
  default     = 80
}

# default https port
variable "https_port" {
  description = "https port"
  type        = number
  default     = 443
}

# main domain for fqdn
variable "route53_zone" {
  description = "the domain to use for the url"
  type        = string
}

# subdomain for fqdn
variable "route53_subdomain" {
  description = "the subdomain of the url"
  type        = string
}

# email for validating lets encrypt certificate
variable "cert_email" {
  description = "email address used to obtain ssl certificate"
  type        = string
}

# ami id of the image to use for the instance
variable "ami" {
  description = "AMI id of the image"
  type        = string
  default     = "ami-0042da0ea9ad6dd83"
}

# instance type
variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}