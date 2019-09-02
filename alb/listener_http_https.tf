# redirect_http_to_https
resource "aws_lb_listener" "redirect_http_to_https_listener" {
  load_balancer_arn    = aws_alb.alb.arn
  port                 = 80
  protocol             = "HTTP"

  default_action {
    type               = "redirect"

    redirect {
      port             = 443
      protocol         = "HTTPS"
      status_code      = "HTTP_301"
    }
  }
}