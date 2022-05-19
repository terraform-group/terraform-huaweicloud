locals {
  secgroup_name = "dev-secgroup"
  secgroup_desc = "dev group"
}

module "dev-secgroup" {
  source        = "../../../modules/secgroup"
  secgroup_name = local.secgroup_name
  secgroup_desc = local.secgroup_desc

}