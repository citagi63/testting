#####################
######## VPC ########
#####################

module "vpc" {
  source                  = "./blueprints/vpc"
  app_port                = ""
  availability_zones      = ["us-east-1a", "us-east-1b"]
  aws_default_region      = var.aws_default_region
  environment             = var.environment
  main_pvt_route_table_id = ""
  platform_name           = var.platform_name
  private_subnet_tag_name = ""
  public_subnet_tag_name  = ""
  vpc_tag_name            = ""
}

#####################
#### ECS Cluster ####
#####################

module "ecs-cluster" {
  source           = "./module/ecs-cluster"
  cluster_tag_name = var.cluster_name
  cluster_name     =  var.cluster_name
}

#########################################
#### ECS task definition and service ####
#########################################

module "ecs-fargate" {
  source                           = "./module/ecs-fargate"
  #app_count                       = ""
  app_image                        = "nginx"
  #app_port                        = 0
  #aws_default_region              = ""
  #aws_security_group_ecs_tasks_id = ""
  #enable_cross_zone_load_balancing = ""
  environment                      = ""
  #fargate_cpu                     = 0
  #fargate_memory                  = 0
  #name                            = ""
  #private_subnet_ids              = []
  vpc_id                           = "${module.vpc.vpc_id}"
  alb_name                         = var.alb_name
  region                           = var.aws_default_region     
  private_subnet_ids               = "${module.vpc.private_subnet_ids}"
  cluster_name                     = "${module.ecs-cluster.cluster_name}"
  
}

