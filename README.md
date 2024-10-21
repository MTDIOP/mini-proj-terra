.
├── README.md

├── app

│   └── main.tf

├── creds

│   └── credentials

└── modules

    ├── ebs_m

    │   ├── main.tf

    │   ├── outputs.tf

    │   └── variable.tf

    ├── ec2_m

    │   ├── devops-mdiop.pem

    │   ├── main.tf # 

    aws ec2 describe-images  --region us-east-1 --owners amazon --filters Name=name,Values=*ubuntu-bionic* Name=architecture,Values=x86_64

    │   ├── outputs.tf

    │   └── variable.tf

    ├── ippub_m


    │   ├── main.tf

    │   └── outputs.tf

    └── secu_m
        ├── main.tf

        ├── outputs.tf

        └── variable.tf

7 directories, 15 files

####################To Execute ###############
Go to 
# cd app
# terraform init
# terraform plan
# terraform apply
##################EC2 image #########################
------------------------Volume-----------------------------
![alt text](image.png)

------------------------Elastic IP-------------------------
![alt text](image-1.png)

------------------------Security Group----------------------
![alt text](image-2.png)

------------------------EC2--------------------------------
![alt text](image-3.png)

------------------------aws_volume_attachment------------------------
![alt text](image-5.png)

------------------------aws_eip_association------------------------
![alt text](image-4.png)

----------------aws_network_interface_sg_attachment------------------
![alt text](image-6.png)

----------------NGINX Install------------------
![alt text](image-7.png)

----------------S3 TFSATE------------------
S3 Tfstate 
![alt text](image-8.png)
##################Destroy#########################

# terraform destroy