provider "huaweicloud" {
  region = var.region

}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket   = "tfdemo-backend-bucket"
    key      = "env/dev/network/terraform-dev-network.tfstate"
    region   = "cn-north-1"
    endpoint = "obs.cn-north-1.myhuaweicloud.com"

    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_credentials_validation = true
  }
}