data "aws_ami" "app_ami" {
  most_recent = true
 
  filter {
    name   = "name"
  
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-*"]
  }
}

resource "aws_instance" "ec2module" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = "devops-mdiop"
  tags          = var.aws_common_tag
  availability_zone = var.availability_zone

}
