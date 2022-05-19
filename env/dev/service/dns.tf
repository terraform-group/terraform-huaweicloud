provider "tencentcloud" {
  region = "ap-beijing"
}

resource "tencentcloud_dnspod_record" "tfdemo" {
  domain      = "idevops.site"
  record_type = "A"
  record_line = "默认"
  value       = huaweicloud_vpc_eip.elb-eip.address
  sub_domain  = "tfdemo"
}