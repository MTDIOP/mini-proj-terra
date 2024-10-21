output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.ec2module.id
}

output "instance_type" {
  description = "Type of the instance"
  value       = aws_instance.ec2module.instance_type
}

output "public_ip" {
  description = "ID of the instance"
  value       = aws_instance.ec2module.public_ip
}

output "availability_zoned" {
  description = "ID of the instance"
  value       = aws_instance.ec2module.availability_zone
}

output "primary_network_interface_id" {
  description = "ID of network Primary"
  value       = aws_instance.ec2module.primary_network_interface_id
}
