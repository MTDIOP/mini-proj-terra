output "volume_id" {
  description = "ID of the volume"
  value       = aws_ebs_volume.mp_ebs.id
}