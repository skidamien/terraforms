resource "aws_vpc" "vpc-main" {
  cidr_block = "10.8.0.0/16"

  tags = local.common_tags
}

resource "aws_subnet" "subnet-singleinstance" {
  cidr_block        = cidrsubnet(aws_vpc.vpc-main.cidr_block, 8, 8)
  vpc_id            = aws_vpc.vpc-main.id
  availability_zone = "us-east-1a"

  tags = local.common_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-main.id

  tags = local.common_tags
}

resource "aws_default_route_table" "r" {
  default_route_table_id = aws_vpc.vpc-main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = local.common_tags
}

