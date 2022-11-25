#####################
######## VPC ########
#####################

module "vpc_ecs" {
  source                  = "./blueprints/vpc"
  app_port                = ""
  availability_zones      = []
  aws_default_region      = ""
  environment             = ""
  main_pvt_route_table_id = ""
  platform_name           = ""
  private_subnet_tag_name = ""
  public_subnet_tag_name  = ""
  vpc_tag_name            = ""
}

#####################
#### ECS Cluster ####
#####################

module "ecs_cluster" {
  source           = "./module/ecs-cluster"
  cluster_tag_name = ""
  name             = ""
}

#########################################
#### ECS task definition and service ####
#########################################

module "ecs_fargate" {
  source                           = "./module/ecs-fargate"
  app_count                        = ""
  app_image                        = ""
  app_port                         = 0
  aws_default_region               = ""
  aws_security_group_ecs_tasks_id  = ""
  cluster_id                       = ""
  enable_cross_zone_load_balancing = ""
  environment                      = ""
  fargate_cpu                      = 0
  fargate_memory                   = 0
  name                             = ""
  private_subnet_ids               = []
  vpc_id                           = ""
}

