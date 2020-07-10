resource "aws_key_pair" "my-aws-key" {
  key_name   = "my-aws-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

##Define AWS provider
provider "aws" {
  region            = var.aws-region
}


##Create masters instances
resource "aws_instance" "k8s-master" {
  count             = var.master-count
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = aws_key_pair.my-aws-key.key_name

  tags = {
    Name            = "${var.tag-name}-k8s-master-${count.index}"
  }
}

##Create masters instances
resource "aws_instance" "k8s-node" {
  count             = var.node-count
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = aws_key_pair.my-aws-key.key_name

  tags = {
    Name            = "${var.tag-name}-k8s-node-${count.index}"
  }
}
