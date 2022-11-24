output vpc_arn {
  value = aws_vpc.conductor_vpc.arn
}

output vpc_id {
  value = aws_vpc.conductor_vpc.id
}

output private_subnet_ids {
  value = aws_subnet.conductor_private_subnet.*.id
}

output main_pvt_route_table_id {
  value = aws_vpc.conductor_vpc.main_route_table_id
}

output vpc_tag_name {
  value = aws_vpc.conductor_vpc.tags.Name
}

output "vpc_cidr_block" {
  value = aws_vpc.conductor_vpc.cidr_block
}

output "private_subnet_cidr_blocks" {
  value = aws_subnet.conductor_private_subnet.*.cidr_block
}
output "private_Db_id" {
  value = aws_subnet.conductor_private_subnet_db.*.id
}
