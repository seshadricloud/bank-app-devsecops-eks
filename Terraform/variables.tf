variable "vpc-name" {
  type    = string
  default = "bankapp-vpc"
}

variable "bankapp-vpc-public-subnet1" {
  type    = string
  default = "bankapp-vpc-public-subnet1"
}

variable "bankapp-vpc-public-subnet2" {
  type    = string
  default = "bankapp-vpc-public-subnet2"
}

variable "bankapp-igw" {
  type    = string
  default = "bankapp-igw"
}