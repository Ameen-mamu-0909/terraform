resource "aws_instance" "terraform" {
  ami                         = "ami-00e801948462f718a"
  instance_type               = "t3.micro"
  key_name                    = "ameen"
  subnet_id                   = "subnet-0f3560bfdb9b5630d"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  tags = {
    Name      = "mamu"
    terraform = "true"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/devops/daws-86s/ameen.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo yum update -y ",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo systemctl restart nginx"
    ]
  }
}
resource "aws_security_group" "allow_all" {
  name = "allow_all"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
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
  tags = {
    Name = "allow_all"
  }
}