output vpc_arn {
  value = module.vpc.vpc_arn
}
 output private_subnet_ids {
  value = module.vpc.private_subnet_tag_name.id
}
 

output vpc_id {
  value = module.vpc.vpc_id
}

output main_pvt_route_table_id {
  value = module.vpc.main_pvt_route_table_id
}

output "vpc_tag_name" {
  value = module.vpc.vpc_tag_name
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output private_subnet_cidr_blocks {
  value = module.vpc.private_subnet_cidr_blocks
}

output security_group_lb_name {
  value = aws_security_group.lb.id
}
