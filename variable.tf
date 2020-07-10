variable "master-count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}


variable "node-count" {
  description = "Number of instances to launch"
  type        = number
  default     = 2
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  default        = "ami-085925f297f89fce1"
}

variable "aws-region" {
  description = "Region to use"
  default        = "us-east-1"
}

variable "tag-name" {
  description = "Region to use"
  default        = "a-tag"
}


variable "instance_type" {
  description = "Instance type to use"
  default        = "t2.micro"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "my-aws-key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "my-aws-key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

