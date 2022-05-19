
locals {
  bandwidth_name = "dev-bandwidth"
  instances      = module.dev-ecs.*.instance_id
}


module "dev-eip" {
  source         = "../../../modules/eip"
  bandwidth_name = local.bandwidth_name
  instances      = local.instances
}


//ELB-EIP
resource "huaweicloud_vpc_eip" "elb-eip" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    share_type = "WHOLE"
    id         = module.dev-eip.bandwidth_id
  }
}
resource "huaweicloud_networking_eip_associate" "eip_elb" {
  public_ip = huaweicloud_vpc_eip.elb-eip.address
  port_id   = module.dev-elb.elb_vip_port_id
}