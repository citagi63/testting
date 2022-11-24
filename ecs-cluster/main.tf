resource "aws_ecs_cluster" "conductor" {
    name = var.cluster_name
    tags = {
    Name = var.cluster_tag_name
  }
}

