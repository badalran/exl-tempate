module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

}
  
resource "aws_subnet" "private_subnet" {
  count = "${var.subnet_count}"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.0.0.${count.index * 64}/26"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  tags = {
   Name = "${var.vpc_name}-${element(data.aws_availability_zones.available.names, count.index)}-net${count.index + 1}"
  }
}


resource "aws_default_security_group" "default" {
  vpc_id = module.vpc.vpc_id

  # ingress {
  #   from_port = 0
  #   to_port   = 0
  #   protocol  = -1
  #   self      = true
  # }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
