variable "location" {
  default = "West Europe"
}

variable "network" {
  default = ["10.5.0.0/16", "10.5.1.0/24", "10.5.2.0/24"]
}

variable "tags" {
  default = {
    Environment = "Production"
    Project     = "lightApp"
    Owner       = "barakat"
  }
}

variable "dns_prefix" {
  default = "light-k8s"
}

variable "node_pool" {
  default = ["default",1,"Standard_D2_v2"]
}

variable "network_profile" {
  default = ["azure","azure","standard"]
}

variable "access_policy" {
  default = ["rwdl", "2024-01-02T09:38:21.0000000Z", "2024-07-02T10:38:21.0000000Z"]
}



variable "k8s_version" {
  default = "1.21"
}
