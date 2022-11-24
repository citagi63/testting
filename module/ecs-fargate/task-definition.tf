resource "aws_ecs_task_definition" "conductor_task" {
    family = var.ecr_repo
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = 256
    memory                   = 512
    execution_role_arn      = aws_iam_role.task_role.arn
    task_role_arn            = aws_iam_role.ecs_tasks.arn
    container_definitions = jsonencode([{
    name        = "${var.cluster_name}-container-${var.environment}"
    image       = "${var.app_image}:latest"
    essential   = true
    environment = [{"name": "VARNAME", "value": var.environment}]
    portMappings = [{
        protocol      = "tcp"
        containerPort = var.container_port
        hostPort      = var.container_port
   }]
}])
}

