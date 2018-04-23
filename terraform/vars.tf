
variable "packet_auth_token" {
  description = "Your packet API key"
}

variable "packet_project_id" {
  description = "Packet Project ID"
}

variable "packet_facility" {
  description = "Packet facility: US East(ewr1), US West(sjc1), Tokyo (nrt1) or EU(ams1). Default: ewr1"
  default = "ewr1"
}

variable "compute-amd64_type" {
  description = "Instance type of OpenStack AMD64 compute nodes"
  default = "baremetal_2"
}

variable "compute-amd64_count" {
  description = "Number of OpenStack AMD64 compute nodes to deploy"
  default = "10"
}

variable "compute-arm_type" {
  description = "Instance type of OpenStack ARM compute nodes"
  default = "baremetal_2a"
}

variable "compute-arm_count" {
  description = "Number of OpenStack ARM compute nodes to deploy"
  default = "0"
}

variable "cloud_ssh_public_key_path" {
  description = "Path to your public SSH key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "cloud_ssh_key_path" {
  description = "Path to your private SSH key for the project"
  default = "~/.ssh/id_rsa"
}
