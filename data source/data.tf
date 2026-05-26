data "aws_instance" "ameen" {
    instance_type = "t3.micro"
}

filter {
    name = "image_id"
    values = ["ami-0236922087fa98b6e"]
}

filter {
    name = "ec2_tags"
    values = ["name_tag"]
}