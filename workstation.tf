module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "workstation"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_minikube.id]
  subnet_id              = "subnet-0e241a2aea0c68c49" #replace your default subnet id
  user_data              = file("install_kubectl.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_minikube" {
  name        = "allow_minikube"
  description = "created for minikube"
  tags = {
    Name = "allow_minikube"
  }

  ingress {
    description = "all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}