resource "aws_instance" "terraform" {
    for_each = toset(var.instances)
    ami = "ami-0236922087fa98b6e"
    instance_type = "t3.micro"
    tags = {
        Name = "ameen"
        terraform = "true"
    }
}  

