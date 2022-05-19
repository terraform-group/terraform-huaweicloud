terraform {
  backend "s3" {
    bucket   = "tfdemo-backend-bucket"
    key      = "global/backend/terraform-global-backend.tfstate"
    region   = "cn-north-1"
    endpoint = "obs.cn-north-1.myhuaweicloud.com"

    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_credentials_validation = true
  }
}

# terraform {
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }