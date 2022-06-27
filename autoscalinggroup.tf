# launch config
resource "aws_launch_configuration" "webapp" {
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.private.id]
  associate_public_ip_address = false

  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get install -y nginx
    sudo service nginx restart
    EOF

  # Required when using a launch configuration with an auto scaling group.
  # https://www.terraform.io/docs/providers/aws/r/launch_configuration.html
  lifecycle {
    create_before_destroy = true
  }
}

# auto scaling group
resource "aws_autoscaling_group" "webapp" {
  launch_configuration = aws_launch_configuration.webapp.name
  vpc_zone_identifier  = [aws_subnet.private.id]

  target_group_arns = [aws_lb_target_group.web.arn]
  health_check_type = "ELB"

  min_size = 1
  max_size = 2

  tag {
    key                 = "Name"
    value               = var.name_tag
    propagate_at_launch = true
  }
}