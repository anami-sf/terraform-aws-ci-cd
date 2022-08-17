resource "aws_lb" "web_app_lb" {
  name               = "web-app-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = data.aws_subnets.default_subnet_ids.ids
}
