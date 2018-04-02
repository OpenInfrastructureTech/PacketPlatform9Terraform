
resource "null_resource" "compute-gw-p9" {

  connection {
    host = "${packet_device.compute-gw.access_public_ipv4}"
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

#  provisioner "remote-exec" {
#    inline = [
#      "bash platform9-setup.sh > platform9-setup.out",
#      "bash platform9-install.sh > platform9-install.out",
#    ]
#  }

}
