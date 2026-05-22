resourse "aws_instance" "terraform" {
    ami = "ami-0236922087fa98b6e"
    instance_type = "t3.micro"
    vpc_security_group_id = [aws_security_group.allow-ssh.id]
    tags = {
        name = "ameen"
        terraform = "true"
    }
}

resource "aws_security_group" "allow-ssh" {
     name = "allow-ssh"
}

resource "aws_security_group" "allow-ssh" {
    security_group_id = aws_security_group.allow-ssh.id
    from_port = 22
    to_port   = 22
    ip_protocol  = "tcp" 
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_instance_group" "allow-ssh" {
    security_group_id = aws_security_group.allow-ssh.id
    ip_protocol = "-1"
    cidr_ipv4   = "0.0.0.0/0"

    tags = {
        name = "allow-ssh"
    }
}