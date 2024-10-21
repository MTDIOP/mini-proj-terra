resource "aws_ebs_volume" "mp_ebs" {
  availability_zone = "us-east-1a"
  size              = var.ebs_size

  tags = {
    Name = "mp_ebs"
  }
}