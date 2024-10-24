provider "aws" {
  region                  = "us-east-1"
  shared_credentials_files = ["../creds/credentials"]
  profile                 = "miniproj_access_aws"
}
locals {
 l_availability_zone = "us-east-1a"
}
module "mp_ebs" {
  source = "./../modules/ebs_m"
  ebs_size = 6
  ebs_availability_zone = local.l_availability_zone
}

module "mp_security_grp" {
  source = "./../modules/secu_m"
  sg_name = "mdiop-mp-sg"
}

module "mp_eip" {
  source = "./../modules/ippub_m"
}

module "mp_instance" {
  source = "./../modules/ec2_m"
  instancetype ="a1.medium"
  availability_zone = local.l_availability_zone
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.mp_ebs.volume_id
  instance_id = module.mp_instance.instance_id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.mp_instance.instance_id
  allocation_id = module.mp_eip.ippubid
provisioner "local-exec" {
    # local-exec
    command = "echo INSTANCE TYPE : ${module.mp_instance.instance_type} >> ip_ec2.txt"
  }
  provisioner "local-exec" {
    # local-exec
    command = "echo PUBLIC_IP : ${module.mp_instance.public_ip} >> ip_ec2.txt"
  }

  provisioner "local-exec" {
    # local-exec
    command = "echo AVAILABILITY ZONE: ${module.mp_instance.availability_zoned}  >> ip_ec2.txt"
  }

  provisioner "remote-exec" {
    # Establishes connection to be used by all
    # generic remote provisioners (i.e. file/remote-exec)
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./../creds/devops-mdiop.pem")
      host        = self.public_ip
    }

    inline = [
      "sudo apt update -y",
      "sudo apt upgrade -y",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = "${module.mp_security_grp.secgrpid}"
  network_interface_id = "${module.mp_instance.primary_network_interface_id}"
}


terraform {
  backend "s3" {
    bucket     = "terraform-backend-mdiop"
    key        = "terraform-mdiop-miniproj"
    region     = "us-east-1"
    shared_credentials_files = ["../creds/credentials"]
    profile                 = "miniproj_access_aws"
  }
}