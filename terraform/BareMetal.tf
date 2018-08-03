resource "packet_device" "compute-amd64" {
  hostname = "${format("compute-amd64-%02d", count.index)}"

  count = "${var.compute-amd64_count}"

  operating_system = "ubuntu_16_04"
  plan             = "${var.compute-amd64_type}"

  connection {
    user = "root"
    private_key = "${file("${var.cloud_ssh_key_path}")}"
  }
  user_data     = "#cloud-config\n\nssh_authorized_keys:\n  - \"${file("${var.cloud_ssh_public_key_path}")}\""
  facility      = "${var.packet_facility}"
  project_id    = "${var.packet_project_id}"
  billing_cycle = "hourly"

#  public_ipv4_subnet_size  = "29"
}
