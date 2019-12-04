output "public_ip" {
  description = "Public IP"
  value       = aws_instance.ec2.*.public_ip
}

output "instance_id" {
  description = "Instance IDs"
  value       = aws_instance.ec2.*.id
}

