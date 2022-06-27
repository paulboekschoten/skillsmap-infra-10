# target group
resource "aws_lb_target_group" "web" {
  name     = "${var.name_tag}-http"
  port     = var.http_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}