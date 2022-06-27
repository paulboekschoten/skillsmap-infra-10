# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.name_tag
  }
}

# subnets
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.name_tag}-private"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_public1
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.name_tag}-public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_public2
  availability_zone = "${var.region}b"

  tags = {
    Name = "${var.name_tag}-public2"
  }
}