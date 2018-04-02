
resource "null_resource" "compute-prometheus-node-exporter" {

  count = "${var.compute-amd64_count}"

  connection {
    host = "${element(packet_device.compute-amd64.*.access_public_ipv4, count.index)}"
    private_key = "${file("${var.cloud_ssh_key_path}")}"
  }

  provisioner "file" {
    source      = "PrometheusNodeExporterSetup.sh"
    destination = "PrometheusNodeExporterSetup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "bash PrometheusNodeExporterSetup.sh > PrometheusNodeExporterSetup.out",
    ]
  }

}
