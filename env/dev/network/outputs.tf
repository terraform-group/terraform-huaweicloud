output "vpc_id" {
  value = module.dev-vpc.vpc_id
}

output "subnet_id" {
  value = module.dev-vpc.subnet_id
}

output "subnet_subnet_id" {
  value = module.dev-vpc.subnet_subnet_id
}

output "secgroup_id" {
  value = module.dev-secgroup.secgroup_id
}