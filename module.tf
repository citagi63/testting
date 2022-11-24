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
  # domain_name                    = .terraform/modules/opensearch.var.domain_name # string
  #ebs_enabled                    = # bool
  #elasticsearch_version          = # string
  #instance_count                 = # number
  #instance_type                  = # string
  #internal_user_database_enabled = # bool
  #master_user_name               = # string
  #master_user_password           = # string
  #subnet_id                      = # string
  #volume_size                    = # number
  #volume_type                    = # string

  # Optional inputs 
  # enforce_https       = bool
  # include_numbers     = bool
  # tls_security_policy = string
}
