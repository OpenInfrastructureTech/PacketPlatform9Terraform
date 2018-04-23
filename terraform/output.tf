output "Compute AMD64 IPs" {
  value = "${packet_device.compute-amd64.*.access_public_ipv4}"
}
