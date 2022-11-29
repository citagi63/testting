# ECR
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.aws_default_region}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids          = module.vpc.private_subnet_ids

  security_group_ids = [
    aws_security_group.ecs_tasks.id,
  ]

  tags = {
    Name = "ECR Docker VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}

resource "aws_vpc_endpoint" "ecr_dkr_api" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.aws_default_region}.ecr.api"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids          = module.vpc.private_subnet_ids

  security_group_ids = [
    aws_security_group.ecs_tasks.id,
  ]

  tags = {
    Name = "ECR API VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}

# CloudWatch
resource "aws_vpc_endpoint" "cloudwatch" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.aws_default_region}.logs"
  vpc_endpoint_type = "Interface"
  subnet_ids          = module.vpc.private_subnet_ids
  private_dns_enabled = true

  security_group_ids = [
    aws_security_group.ecs_tasks.id,
  ]

  tags = {
    Name = "CloudWatch VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}

# S3
    resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = ["${module.vpc.main_pvt_route_table_id}"]

  tags = {
    Name = "S3 VPC Endpoint Gateway - ${var.environment}"
    Environment = var.environment
  }
}

# RDS
resource "aws_vpc_endpoint" "rds" {
  vpc_id = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.aws_default_region}.rds"
  vpc_endpoint_type = "Interface"
  subnet_ids = module.vpc.private_subnet_ids
  private_dns_enabled = true

  security_group_ids = [
    aws_security_group.ecs_tasks.id,
  ]

  tags = {
    Name = "RDS VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}

resource "aws_vpc_endpoint" "rds-data" {
  vpc_id = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.aws_default_region}.rds-data"
  vpc_endpoint_type = "Interface"
  subnet_ids = module.vpc.private_subnet_ids
  private_dns_enabled = true

  security_group_ids = [
    aws_security_group.ecs_tasks.id,
  ]

  tags = {
    Name = "RDS Data VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}
