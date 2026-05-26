resource "aws_instance" "terraform" {
    count = 2
    ami = "ami-0236922087fa98b6e"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = {
        Name = "ameen"
        terraform = "true"

    }
}

resource "aws_security_group" "allow_all" {
    name = "allow-all"

    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1" 
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        to_port   = 0
        protocol  = "-1" 
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "allow-all"
    }
}
