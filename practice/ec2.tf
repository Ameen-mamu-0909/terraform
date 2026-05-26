variable "instances" {
  type = list(string)

  default = ["jenkins", "docker", "ansible"]
}



resource "aws_instance" "terraform" {
  for_each      = toset(var.instances)
  ami           = "ami-0236922087fa98b6e"
  subnet_id     = "subnet-0f3560bfdb9b5630d"
  instance_type = "t3.micro"
  tags = {
    Name      = each.key
    terraform = "true"
  }
}