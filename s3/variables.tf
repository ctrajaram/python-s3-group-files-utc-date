variable "aws_region" {
  type        = string
  description = "This is the aws region where the resources will be deployed"
}
variable "aws_projectname" {
  type        = string
  description = "This is the project name"
}

variable "bucketname" {
  type        = string
  description = "This is the cidr block for the vpc"
}