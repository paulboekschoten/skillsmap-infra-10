# target group
resource "aws_lb_target_group" "web" {
  name     = "${var.name_tag}-http"
  port     = var.http_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

# load balancer
resource "aws_lb" "app" {
  name               = var.name_tag
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]

  tags = {
    Environment = var.name_tag
  }
}

## route53 fqdn
# fetch zone
data "aws_route53_zone" "selected" {
  name         = var.route53_zone
  private_zone = false
}
# create record
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.route53_subdomain}.${var.route53_zone}"
  type    = "A"

  alias {
    name                   = aws_lb.app.dns_name
    zone_id                = aws_lb.app.zone_id
    evaluate_target_health = true
  }
}
