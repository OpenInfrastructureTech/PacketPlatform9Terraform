
resource "null_resource" "compute-p9" {

  count = "${var.compute-amd64_count}"

  connection {
    host = "${element(packet_device.compute-amd64.*.access_public_ipv4, count.index)}"
    private_key = "${file("${var.cloud_ssh_key_path}")}"
  }

  provisioner "file" {
    source      = "platform9-setup.sh"
    destination = "platform9-setup.sh"
  }

  provisioner "file" {
    source      = "platform9-install.sh"
    destination = "platform9-install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "bash platform9-setup.sh > platform9-setup.out",
      "bash platform9-install.sh --no-proxy --ntpd > platform9-install.out",
    ]
  }

}
