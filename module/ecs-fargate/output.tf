
output task-defination-name{
  value = aws_ecs_task_definition.conductor_task.family
}
output ecs-service-name {
  value = aws_ecs_service.main.name
}
output ecr-repo-name {
  value = aws_ecr_repository.ecr_repo.name
}
output ecr-repo-url {
  value = aws_ecr_repository.ecr_repo.repository_url
}
output aLb-name {
  value = aws_lb.alb.name
}
output security-group-id {
  value = aws_security_group.alb.id
}
output image {
  value = var.app_image
}

