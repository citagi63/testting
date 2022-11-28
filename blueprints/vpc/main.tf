module "vpc" {
  source                        = "../../module/vpc"
  vpc_tag_name                  = "${var.platform_name}-vpc"
  number_of_private_subnets     = 2
  private_subnet_tag_name       = "${var.platform_name}-private-subnet"
  #route_table_tag_name          = "${var.platform_name}-rt"
  environment                   = var.environment
  security_group_lb_name        = "${var.platform_name}-alb-sg"
  #security_group_ecs_tasks_name = "${var.platform_name}-ecs-tasks-sg"
  app_port                      = var.app_port
  main_pvt_route_table_id       = module.vpc.main_pvt_route_table_id
  availability_zones            = var.availability_zones
  aws_default_region            = var.aws_default_region
  public_subnet_tag_name        = "${var.platform_name}-public-subnet"
  number_of_public_subnets      = 2
}

  resource "aws_security_group" "lb" {
  name        = "${var.security_group_lb_name}-${var.environment}"
  description = var.security_group_lb_description
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
      Nam = "loadbalacer"
    }
}


resource "aws_security_group" "ecs_tasks" {
  name        = "${var.security_group_ecs_tasks_name}-${var.environment}"
  description = var.security_group_ecs_tasks_description
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = [var.vpc_cidr_block]
  }

  ingress {
    protocol        = "tcp"
    from_port       = 443
    to_port         = 443
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }
  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [
      aws_vpc_endpoint.s3.prefix_list_id
    ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
