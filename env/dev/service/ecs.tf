locals {
  availability_zone = "cn-north-1a"
  flavor_id         = data.huaweicloud_compute_flavors.flavor_1C1G.ids[0]
  instance_name     = "dev-ecs"
  counts            = 2
  subnet_id         = data.terraform_remote_state.network.outputs.subnet_id
  vpc_id            = data.terraform_remote_state.network.outputs.vpc_id
  image_id          = data.huaweicloud_images_image.image.id
  secgroup_id       = data.terraform_remote_state.network.outputs.secgroup_id
}

module "dev-ecs" {
  source            = "../../../modules/ecs"
  count             = local.counts
  availability_zone = local.availability_zone
  flavor_id         = local.flavor_id
  instance_name     = "${local.instance_name}-${count.index}"
  subnet_id         = local.subnet_id
  vpc_id            = local.vpc_id
  image_id          = local.image_id
  secgroup_id       = local.secgroup_id

}

data "huaweicloud_compute_flavors" "flavor_1C1G" {
  availability_zone = local.availability_zone
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 1
}

# output "ecs_flavor" {
#   value = data.huaweicloud_compute_flavors.flavor_1C1G.ids[0]
# }

data "huaweicloud_images_image" "image" {
  architecture = "x86"
  os_version   = "CentOS 7.6 64bit"
  visibility   = "public"
  most_recent  = true
}

# output "image_id" {
#     value = data.huaweicloud_images_image.image.id

# }