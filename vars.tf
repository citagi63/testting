variable "aws_default_region" {}

variable "org_name" {}
variable "platform_name" {}

#variable "security_group_id" {}

variable "environment" {}

#variable "account_id" {}

#variable "deployment_service_account_user_arn" {}
variable avalability_zones {}
variable cluster_name {}
variable alb_name {}
variable availability_zones{
   type= list(string)
   default = ["us-east-1a","us-east-1b"]
}
variable app_image {}
