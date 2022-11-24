module "vpc" {
  source = "./vpc"
  app_port = var.app_port
  vpc_tag_name= var.vpc_tag_name
  main_pvt_route_table_id = var.main_pvt_route_table_id
  environment = var.environment
  public_subnet_tag_name = var.public_subnet_tag_name
  aws_default_region = var.aws_default_region
  #vpc_tag_name = var.vpc_tag_name
  private_subnet_tag_name = var.private_subnet_tag_name
}
