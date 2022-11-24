module "vpc" {
  source                        = "./vpc"
  vpc_tag_name                  = "${var.platform_name}-vpc"
  number_of_private_subnets     = 2
  private_subnet_tag_name       = "${var.platform_name}-private-subnet"
  route_table_tag_name          = "${var.platform_name}-rt"
  environment                   = var.environment
  #security_group_lb_name        = "${var.platform_name}-alb-sg"
  #security_group_ecs_tasks_name = "${var.platform_name}-ecs-tasks-sg"
  app_port                      = var.app_port
  main_pvt_route_table_id       = module.vpc.main_pvt_route_table_id
  availability_zones            = var.availability_zones
  aws_default_region            = var.aws_default_region
  public_subnet_tag_name        = "${var.platform_name}-public-subnet"
  number_of_public_subnets      = 2
}
