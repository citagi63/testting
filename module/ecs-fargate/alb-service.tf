resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = true
  load_balancer_type = "application"
  subnets            = var.private_subnet_ids
  security_groups    = [aws_security_group.allow_alb.id]
  enable_cross_zone_load_balancing = true

  enable_deletion_protection = false

  tags = {
    Environment = var.environment
  }
}
resource "aws_lb_target_group" "alb_tg" {
  depends_on  = [
    aws_lb.alb
  ]
  name        = "alb-${var.environment}-tg"
  port        = var.container_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  connection_termination = false
}
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.container_port
  protocol    = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.alb_tg.id
    type             = "forward"
  }
}
