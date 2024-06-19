resource "aws_spot_instance_request" "rabbitmq" {
  ami                    = data.aws_ami.centos8.id
  instance_type          = var.instance_type
  wait_for_fulfillment   = true
  user_data              = file("setup_k8s_worker_node.sh")

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ec2_tag" "name-tag" {
  resource_id = aws_spot_instance_request.rabbitmq.spot_instance_id
  key         = "Name"
  value       = var.instance_name
}
