variable "region" {
  description = "Region for deployment"
  default = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID: Ubuntu 24.04"
  default = "ami-04b4f1a9cf54c11d0"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}

variable "key_pair" {
  description = "Key pair to access instances"
  sensitive = true
}