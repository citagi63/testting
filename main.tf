module "vpc" {
  source  = "spacelift.io/citagi63/vpc/aws"
  version = "0.1.0"

  # Required inputs 
  app_port                = var.app_port
  aws_default_region      = # string
  environment             = # string
  main_pvt_route_table_id = # string
  private_subnet_tag_name = # string
  public_subnet_tag_name  = # string
  vpc_tag_name            = # string

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
