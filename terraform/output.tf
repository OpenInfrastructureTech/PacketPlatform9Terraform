output "Compute AMD64 IPs" {
  value = "${packet_device.compute-amd64.*.access_public_ipv4}"
}

output "Compute A IP" {
  value = "${packet_device.compute-amd64-A.access_public_ipv4}"
}
output "Compute B IP" {
  value = "${packet_device.compute-amd64-B.access_public_ipv4}"
}
output "Compute D IP" {
  value = "${packet_device.compute-amd64-D.access_public_ipv4}"
}
output "Compute F IP" {
  value = "${packet_device.compute-amd64-F.access_public_ipv4}"
}
output "Compute G IP" {
  value = "${packet_device.compute-amd64-G.access_public_ipv4}"
}
output "Compute I IP" {
  value = "${packet_device.compute-amd64-I.access_public_ipv4}"
}
output "Compute J IP" {
  value = "${packet_device.compute-amd64-J.access_public_ipv4}"
}
output "Compute C IP" {
  value = "${packet_device.compute-amd64-C.access_public_ipv4}"
}
