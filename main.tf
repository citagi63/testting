module "vpc" {
  source  = "./vpc/"
 
  # Required inputs 
  app_port                = var.app_port
  aws_default_region      = var.aws_default_region
  environment             = var.environment
  main_pvt_route_table_id = var.main_pvt_route_table_id
  private_subnet_tag_name = var.private_subnet_tag_name
  public_subnet_tag_name  = var.public_subnet_tag_name
  vpc_tag_name            = var.vpc_tag_name

  # Optional inputs 
  # availability_zones            = list(string)
  # number_of_private_subnets     = number
  # number_of_private_subnets_db  = number
  # number_of_public_subnets      = number
  # private_subnet_cidr_blocks    = list(string)
  # private_subnet_cidr_blocks_db = list(string)
  # public_subnet_cidr_blocks     = list(string)
  # vpc_cidr_block                = string
}
