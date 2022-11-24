variable "vpc_tag_name" {
  type        = string
  description = "Name the vpc"
}
variable "environment" {
  type        = string
  description = "Application enviroment"
}
variable "public_subnet_tag_name" {
  type        = string
  description = "Name tag for the public subnet"
}
variable "private_subnet_tag_name" {
  type        = string
  description = "Name tag for the private subnet"
}
variable "number_of_private_subnets" {
  type = number 
  default = 1
  description = "The number of private subnets in a VPC."
}
variable "number_of_public_subnets" {
  type = number 
  default = 1
  description = "The number of public subnets in a VPC."
}
variable "main_pvt_route_table_id" {
  type        = string
  description = "Main route table id"
}
variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDR block range for the public subnets"
}
variable "private_subnet_cidr_blocks_db"{
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
  }
variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
  description = "CIDR block range for the private subnets"
}

variable "app_port" {
  type        = string
  description = "app port"
}

variable "aws_default_region" {}

variable "availability_zones" {
  type  = list(string)
  default = ["us-east-2a", "us-east-2b"]
  description = "List of availability zones for the selected region"
}
variable "number_of_private_subnets_db"{
  type  = number
  default = 2
  description = "number of subnets for DB"
}

