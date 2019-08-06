data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "singleinstance" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.subnet-singleinstance.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.sg_ssh.id}", "${aws_security_group.sg_ssh.id}"]
  key_name   = "damien-personal-key"
  user_data = "${file("./files/user_data.sh")}"  

  tags = "${local.common_tags}"
}
