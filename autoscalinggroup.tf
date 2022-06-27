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