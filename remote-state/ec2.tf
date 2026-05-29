resource "aws_instance" "terraform" {
    ami = "ami-00e801948462f718a"
    instance_type = "t3.micro"
    subnet_id = "subnet-0f3560bfdb9b5630d"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "ameen"
        terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
    name = "allow_all"

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
        Name = "allow_all"      
    }
}