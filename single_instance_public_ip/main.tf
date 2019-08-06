resource "aws_key_pair" "deployer" {
  key_name   = "damien-personal-key"
  public_key = "${var.ec2_ssh_public_key}"
}

locals {
  name = "damien-test"
  CostCenter  = "Damien@autocodigo.com"
  customer = "all"
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Name        = "${local.name}"
    CostCenter  = "${local.CostCenter}"
    Customer	= "${local.customer}"
  }
}


