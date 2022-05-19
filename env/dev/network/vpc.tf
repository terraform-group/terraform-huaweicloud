locals {
  vpc_cidr          = "192.168.0.0/16"
  vpc_name          = "dev1-vpc"
  subnet_name       = "dev1-subnet"
  subnet_cidr       = "192.168.0.0/21"
  subnet_gateway_ip = "192.168.0.1"
  availability_zone = "cn-north-1a"
}

module "dev-vpc" {
  source            = "../../../modules/vpc"
  vpc_cidr          = local.vpc_cidr
  vpc_name          = local.vpc_name
  subnet_cidr       = local.subnet_cidr
  subnet_gateway_ip = local.subnet_gateway_ip
  subnet_name       = local.subnet_name
  availability_zone = local.availability_zone

}