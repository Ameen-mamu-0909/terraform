variable "ami" {
  type    = string
  default = "ami-0236922087fa98b6e"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(string)

  default = {
    Name      = "ameen"
    terraform = "true"
  }
}

variable "sg_name" {
  type    = string
  default = "allow-all"
}

variable "egress_from_port" {
  type    = number
  default = 0
}

variable "egress_to_port" {
  type    = number
  default = 0
}

variable "ingress_from_port" {
  type    = number
  default = 0
}

variable "ingress_to_port" {
  type    = number
  default = 0
}

variable "protocol" {
  type    = string
  default = "-1"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(string)

  default = {
    Name = "allow-all"
  }
}