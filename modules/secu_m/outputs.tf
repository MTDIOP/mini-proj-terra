output "secgrpid" {
  description = "ID of Securit ygroup"
  value       = aws_security_group.mp_allow_traffic.id
}