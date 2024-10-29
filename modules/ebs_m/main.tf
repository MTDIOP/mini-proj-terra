resource "aws_ebs_volume" "mp_ebs" {
  availability_zone = var.ebs_availability_zone
  size              = var.ebs_size

  tags = {
    Name = "mp_ebs"
  }
}