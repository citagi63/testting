module "ecs_fargate" {
  source = "./ecs-fargate"
  alb_name  = "conductor"
  app_image = "nginx"
  vpc_id = module.vpc.vpc_tag_name.id
  region = module.vpc.aws_default_region
  environment = module.vpc.environment
   private_subnet_ids = module.vpc.private_subnet_tag_name.id
  }
