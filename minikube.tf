module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region          = "us-east-1"
  cluster_name        = "roboshop"
  aws_instance_type   = "t3.medium"
  ssh_public_key      = "~/.ssh/minikube.pub"
  aws_subnet_id       = "subnet-0e241a2aea0c68c49"
  ami_image_id        = "ami-0aedf6b1cb669b4c7"
  hosted_zone         = "learninguser.shop"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}
