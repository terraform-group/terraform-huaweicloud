provider "huaweicloud" {
  region = var.region
}

resource "huaweicloud_obs_bucket" "bucket" {
  bucket = "tfdemo-backend-bucket"
  acl    = "private"
  tags = {
    type = "bucket"
  }
}

