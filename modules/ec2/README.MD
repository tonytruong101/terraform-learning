## Overview

In Terraform, a module is a container for multiple resources that are used together. Modules can be used to create reusable components, improve organization, and reduce duplication.

Here is an example of a Terraform module that creates an Amazon Elastic Compute Cloud (EC2) instance:

```
module "ec2" {
  source = "./module/ec2"

  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
}

```

This module takes several variables as input (ami, instance_type, key_name, vpc_security_group_ids, and subnet_id) and creates an EC2 instance using those values. The source attribute specifies the location of the module's code, which can be either a local path or a remote Git repository.

Inside the module, you can define the resources that make up the module, such as an EC2 instance and an Elastic IP address. You can also define outputs, which are values that are returned by the module and can be used by other resources or modules.

Here is an example of an EC2 module that creates an EC2 instance and an Elastic IP address, and returns the public IP address of the instance as an output:

```
resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id

  tags = {
    Name = "ec2-instance"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2.id
}

output "public_ip" {
  value = aws_eip.eip.public_ip
}

```

To use this module, you would call it from another Terraform configuration file and pass in the required variables. For example:

```
module "ec2" {
  source = "./module/ec2"

  ami = "ami-123456"
  instance_type = "t2.micro"
  key_name = "my-key"
  vpc_security_group_ids = ["sg-123456"]
  subnet_id = "subnet-123456"
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}
```

This configuration will create an EC2 instance and Elastic IP address using the specified AMI, instance type, and other variables, and will output the public IP address of the instance.

## Using variables and TFVars
A terraform.tfvars file is a configuration file in Terraform that is used to assign values to variables. It is a good practice to use a terraform.tfvars file to specify the values for your variables, rather than hardcoding them in the configuration files. This allows you to use the same configuration files in different environments or with different values, without modifying the configuration itself.

```
terraform apply -var-file=terraform.tfvars
```
