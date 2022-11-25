#####################
######## VPC ########
#####################

module "vpc" {
  source                  = "./blueprints/vpc"
  app_port                = ""
  availability_zones      = ["us-east-2a" , "us-east-2b"]
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

module "ecs-cluster" {
  source           = "./module/ecs-cluster"
  cluster_tag_name = "conductor"
  cluster_name     =  "conductor"
  #name             = ""
}

#########################################
#### ECS task definition and service ####
#########################################

module "ecs-fargate" {
  source                           = "./module/ecs-fargate"
  #app_count                        = ""
  app_image                        = "nginx"
  #app_port                         = 0
  #aws_default_region               = ""
  #aws_security_group_ecs_tasks_id  = ""
  #cluster_id                       = module.ecs-cluster.cluster_name.id
  #enable_cross_zone_load_balancing = ""
  environment                      = ""
  #fargate_cpu                      = 0
  #fargate_memory                   = 0
  #name                             = ""
  #private_subnet_ids               = []
  vpc_id                           = ""
  alb_name                        = "counductor"
 region                           = "us-east-2"     
private_subnet_ids               = ["subnet-0057b28945ae9b470","subnet-0b1e47cb2a2930c1c"]
  cluster_name                  = "conductor"
}

