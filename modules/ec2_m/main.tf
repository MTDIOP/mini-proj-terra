data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    #values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"] #NOT WORKING
    values = ["amzn2-ami-hvm*"]

  }
}

resource "aws_instance" "ec2module" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = "devops-mdiop"
  tags          = var.aws_common_tag
  availability_zone = "us-east-1a"

}
