
variable "ecr_repo" {
    type = string
    default = "conductor-img"
}
variable "container_port" {
    type = number
    default = 80
}
variable "environment" {
    type = string
}
variable "private_subnet_ids" {
    type = list(string)
}

variable region {}

variable "vpc_id" {
    type = string
}
variable alb_name {
  type  = string 
}
variable "app_image"{
  type  = string
}
variable "cluster_name" {}
