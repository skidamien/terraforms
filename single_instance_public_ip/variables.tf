variable "tag_environment" {
  default = "dev"
}
variable "ec2_ssh_public_key" {
  description = "Key pair in AWS for ec2 instances login"
}
