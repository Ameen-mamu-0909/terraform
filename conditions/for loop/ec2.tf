resource "aws_instance" "terraform" {

    for_each = toset(var.instances)
    ami = "ami-0236922087fa98b6e"
    instance_type = "t3.micro"
    subnet_id = "subnet-0f3560bfdb9b5630d"
    tags = {
        Name = each.key
        terraform = "true"
    }
}  

