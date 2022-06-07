variable "region" {

  default = "us-east-1"
}


variable "access_key" {}

variable "secret_key" {}


## Network
variable "vpc_id" {
  default = "vpc-0990b8ae8af471290"
}
variable "subnet_id" {
  default = "subnet-0fe5973d354bf52e0"
}

variable "security_group_name" {
  description = "O nome do  security group"
  type        = string
  default     = "sgpythonapi"
}

## Default tags
variable "default_tags" {
  type        = map(string)
  description = "Tags padrão para todos os recursos"
  default = {
    Equipe  = "Devops"
    Projeto = "Desafio-devops"
    IaC     = "Terraform"
    Suporte = "br.robsonferreira@gmail.com"
  }

}


## EC2
variable "name_ec2" {
  default = "python-ec2"
}

variable "ami_ec2" {
  default = "ami-04b9e92b5572fa0d1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ec2"
}

