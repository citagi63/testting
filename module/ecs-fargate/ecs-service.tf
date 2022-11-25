resource "aws_ecs_service" "main" {
  name            = "conductor-service"
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.conductor_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
    network_configuration {
    security_groups = [aws_security_group.allow_alb.id]
    subnets         = var.private_subnet_ids
  }
    load_balancer {
    target_group_arn = aws_lb_target_group.alb_tg.arn
    container_name   = "${var.cluster_name}-container-${var.environment}"
    container_port   = var.container_port
  }
  depends_on = [
    aws_ecs_task_definition.conductor_task,
  ]
}

