variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"  
}

variable "project" {
    type = string
}

variable "environment" {
    type = string
}

variable "enable_dns_hostnames" {
    default = true  
}

variable "common_tags" {
    type = map
    default = {
        Terraform = "true"
    }
}

variable "vpc_tags" {
  default = {}
}

variable "igw_tags" {
    default = {}  
}

variable "public_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.public_subnet_cidrs) == 2
        error_message = "Please provide 2 valid database subnet CIDR"
    }
}

variable "private_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.private_subnet_cidrs) == 2
        error_message = "Please provide 2 valid database subnet CIDR"
    }
}

variable "database_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.database_subnet_cidrs) == 2
        error_message = "Please provide 2 valid database subnet CIDR"
    }
}