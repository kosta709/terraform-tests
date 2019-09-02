
resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 8443
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.main.id}"

}

resource "aws_lb_listener" "forwarding_api_revamp_listener" {
  load_balancer_arn     = "${aws_alb.test.arn}"
  port                  = 8443
  protocol              = "HTTP"

  default_action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.test.arn
  }
}

