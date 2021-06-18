terraform {
  required_providers {
    tencentcloud = {
      source = "tencentcloudstack/tencentcloud"
      version = "1.53.7"
    }
  }
}

provider "tencentcloud" {
  region = var.region
}

resource "tencentcloud_vpc" "vpc_main" {
  name = var.vpc_tke_name
  cidr_block = var.vpc_tke_cidr_block
}

resource "tencentcloud_subnet" "vpc_main_tke_subnet" {
  availability_zone = var.availability_zone
  cidr_block = var.subnet_tke_cidr_block
  name = var.subnet_tke_name
  vpc_id = tencentcloud_vpc.vpc_main.id
}

resource "tencentcloud_kubernetes_cluster" "sandbox_cluster" {
  cluster_version                            = var.cluster_version
  vpc_id                                     = tencentcloud_vpc.vpc_main.id
  cluster_cidr                               = var.cluster_cidr
  cluster_max_pod_num                        = var.cluster_max_pod_num
  cluster_name                               = var.cluster_name
  cluster_desc                               = var.cluster_desc
  cluster_max_service_num                    = var.cluster_max_service_num
  cluster_internet                           = true
  cluster_ipvs                               = false
  managed_cluster_internet_security_policies = var.managed_cluster_internet_security_policies
  cluster_deploy_type                        = var.cluster_deploy_type
  cluster_os                                 = var.cluster_os

  worker_config {
    count                      = var.worker_count
    availability_zone          = var.availability_zone
    instance_type              = var.default_instance_type
    system_disk_size           = var.system_disk_size
    system_disk_type           = var.system_disk_type
    internet_charge_type       = var.internet_charge_type
    internet_max_bandwidth_out = var.internet_max_bandwidth_out
    public_ip_assigned         = true
    subnet_id                  = tencentcloud_subnet.vpc_main_tke_subnet.id
    user_data                  = "dGVzdA=="
    password                   = "ZZXXccvv1212"
    hostname                   = "sandbox-worker"
  }
}
