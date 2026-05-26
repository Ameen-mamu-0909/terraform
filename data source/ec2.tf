resource "aws_instance" "terraform" {
    ami = data.ami_id
    instance_type = data.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = {
        Name = data.name_tag
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
