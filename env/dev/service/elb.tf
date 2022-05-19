module "dev-elb" {
  source       = "../../../modules/elb"
  subnet_id    = data.terraform_remote_state.network.outputs.subnet_subnet_id
  instance_ips = module.dev-ecs.*.instance_ip
}