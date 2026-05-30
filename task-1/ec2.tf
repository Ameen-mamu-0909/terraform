    resource "aws_instance" "terraform" {
    ami                         = "ami-0220d79f3f480ecf5"
    instance_type               = "t3.micro"
    subnet_id                   = "subnet-0f3560bfdb9b5630d"
    associate_public_ip_address = true
    key_name                    = "ameen"

    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = {
        Name = "mamu"
    }

    connection {
        type        = "ssh"
        user        = "ec2-user"
        private_key = file("C:/Users/ameen/Downloads/pair.pem")
        host        = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
        "sudo yum update -y",
        "sudo yum install nginx -y",
        "sudo systemctl enable nginx",
        "sudo systemctl start nginx"
        ]
    }
    }

    resource "aws_security_group" "allow_all" {
    name = "allow_all"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_all"
    }
    }
