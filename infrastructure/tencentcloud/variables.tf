variable "hostname" {
  default = "tke-sandbox"
}

variable "availability_zone" {
  default = "na-ashburn-2"
}

variable "cluster_version" {
  default = "1.18.4"
}

variable "cluster_cidr" {
  default = "10.4.0.0/16"
}

variable "default_instance_type" {
  default = "S5.SMALL2"
}

variable "cluster_max_pod_num"{
  default = 32
}

variable "cluster_name"{
  default = "sandbox_tke"
}

variable "cluster_desc"{
  default = "Sandbox TKE Cluster"
}

variable "cluster_max_service_num"{
  default = 32
}

variable "cluster_os" {
  default = "tlinux2.4x86_64"
}

variable "managed_cluster_internet_security_policies"{
  default = ["0.0.0.0/0"]
}

variable "cluster_deploy_type"{
  default = "MANAGED_CLUSTER"
}

variable "worker_count"{
  default = 2
}

variable "system_disk_type"{
  default = "CLOUD_PREMIUM"
}

variable "system_disk_size"{
  default = 50
}

variable "internet_charge_type"{
  default = "TRAFFIC_POSTPAID_BY_HOUR"
}

variable "internet_max_bandwidth_out"{
  default = 100
}