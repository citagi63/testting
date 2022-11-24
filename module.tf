module "vpc" {
  source  = "spacelift.io/citagi63/vpc/default"
  version = "0.1.0"

  # Required inputs 
  app_port                =  80
  aws_default_region      =  "us-east-2"
  environment             =  "dev"
  main_pvt_route_table_id =  "main"
  private_subnet_tag_name =  "conductor-public"
  public_subnet_tag_name  =  "conductor-prate"
  vpc_tag_name            =  "conductor-server"

  # Optional inputs 
   availability_zones            = ["us-east-2a" , "us-east-2b"]
   number_of_private_subnets     = 2
   number_of_private_subnets_db  = 2
   number_of_public_subnets      = 2
   private_subnet_cidr_blocks    = ["10.0.1.0/24" , "10.0.2.0/24"]
   private_subnet_cidr_blocks_db =  ["10.0.3.0/24" , "10.0.4.0/24"]
   public_subnet_cidr_blocks     =  ["10.0.5.0/24" , "10.0.6.0/24"]
  vpc_cidr_block                = "10.0.0.0/16"
}
module "opensearch" {
  source  = "spacelift.io/citagi63/opensearch/default"
  version = "0.1.0"

  # Required inputs 
  dedicated_master_enabled       = true # bool
  domain_name                    = "counductor" # string
  ebs_enabled                    = true # bool
  elasticsearch_version          = "opensearch_2.3" # string
  instance_count                 = 1# number
  instance_type                  = "t3.medium.elasticsearch" # string
  internal_user_database_enabled = true# bool
  master_user_name               = "master" # string
  master_user_password           = "Master@12" # string
  subnet_id                      = module.vpc.private_subnet_tag_name.id # string
  volume_size                    = 20 # number
  volume_type                    = "gp2" # string

  # Optional inputs 
  enforce_https       = true
   include_numbers     = true
  tls_security_policy = ""
}
