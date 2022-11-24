resource "aws_vpc" "conductor_vpc" {
    cidr_block       =  var.vpc_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "${var.vpc_tag_name}-${var.environment}"
    }
}
resource "aws_subnet" "conductor_public_subnet" {
    count =  var.number_of_public_subnets
    vpc_id = aws_vpc.conductor_vpc.id
    cidr_block = element(var.public_subnet_cidr_blocks, count.index)
    availability_zone = element(var.availability_zones, count.index)
    tags = {
        Name = "${var.public_subnet_tag_name}-${var.environment}"
    }         
}
resource "aws_subnet" "conductor_private_subnet" {
    count = var.number_of_private_subnets
    vpc_id =  aws_vpc.conductor_vpc.id
    cidr_block = element(var.private_subnet_cidr_blocks, count.index)
    availability_zone = element(var.availability_zones, count.index)

    tags = {
        Name = "${var.private_subnet_tag_name}-${var.environment}"
    }    
}
resource "aws_subnet" "conductor_private_subnet_db" {
    count = var.number_of_private_subnets_db
    vpc_id =  aws_vpc.conductor_vpc.id
    cidr_block = element(var.private_subnet_cidr_blocks_db, count.index)
    availability_zone = element(var.availability_zones, count.index)

    tags = {
        Name = "${var.private_subnet_tag_name}-db-${var.environment}"
    }    
}
####################################################################################################################################################

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.conductor_vpc.id
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.conductor_vpc.id
  tags = {
    Name = "public-route-table-${var.environment}"
  }
}
resource "aws_route_table_association" "igw_public_subnet_assoc" {
    count= var.number_of_public_subnets
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.conductor_public_subnet[count.index].id 
  }
  resource "aws_route" "ig_public_subnet_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet_gateway.id
}

############################################################################################################################################
resource "aws_eip" "elastic_ip_app" {
  vpc = true
  tags = {
    Name = "elastic_ip-app"
  }
}
resource "aws_nat_gateway" "conductor_nat" {
  allocation_id = aws_eip.elastic_ip_app.id
  count = 1
  subnet_id = aws_subnet.conductor_public_subnet[count.index].id
  tags = {
    Name = "nat_gateway-app-${var.environment}"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.conductor_vpc.id
  tags = {
    Name = "private-route-table-NAT-app-${var.environment}"
  }
}
resource "aws_route_table_association" "nat_private_subnet" {
  count = var.number_of_private_subnets
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.conductor_private_subnet[count.index].id
  }
 resource "aws_route" "nat_private_subnet_route" {
  count = 1
  route_table_id = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.conductor_nat[count.index].id
}

##################################################################################################################################################
resource "aws_eip" "elastic_ip_db" {
  vpc = true
  tags = {
    Name = "elastic_ip-db"
  }
}
resource "aws_nat_gateway" "conductor_nat_db" {
  allocation_id = aws_eip.elastic_ip_db.id
  count = 1
  subnet_id = aws_subnet.conductor_public_subnet[count.index].id
  tags = {
    Name = "nat_gateway-db${var.environment}"
  }
}
resource "aws_route_table" "private_route_table_db" {
  vpc_id = aws_vpc.conductor_vpc.id
  tags = {
    Name = "private-route-table-NAT-DB-${var.environment}"
  }
}
resource "aws_route_table_association" "nat_private_subnet_db" {
  count = var.number_of_private_subnets_db
  route_table_id = aws_route_table.private_route_table_db.id
  subnet_id = aws_subnet.conductor_private_subnet_db[count.index].id
  }
 resource "aws_route" "nat_private_subnet_route_db" {
  count = 1
  route_table_id = aws_route_table.private_route_table_db.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.conductor_nat_db[count.index].id
}
