module "vpc" {
  source = "./vpc"
  app_port = var.app_port
}
