resource "aws_instance" "terraform" {
    ami= "ami-0236922087fa98b6e"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow-all.id]
    tags = {
        Name = "ameen"
        terraform = "true"
    }
}

resource "aws_security_group" "allow-all" {
    name = "allow-all"

    egress {
        from_port   = 0  #from port 0 to port Means all ports
        to_port     = 0
        protocol    = "-1" #Allowing all  protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow-all"
    }
}