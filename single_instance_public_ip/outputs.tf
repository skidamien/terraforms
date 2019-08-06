output "public_ip_address" {
  value = ["${aws_instance.singleinstance.*.public_ip}"]
}
