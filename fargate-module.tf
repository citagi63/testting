#module "ecs-fargate" {
 # source = "./ecs-fargate"
 # alb_name  = "conductor"
 # app_image = "nginx"
 # vpc_id = module.vpc.vpc_tag_name.id
 # region = var.aws_default_region
 # environment = var.environment
  # private_subnet_ids = module.vpc.private_subnet_ids
  #}
