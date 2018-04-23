
apt-get update
apt-get install -y dnsmasq arping conntrack ifenslave vlan
modprobe bridge
modprobe br_netfilter
modprobe 8021q
modprobe bonding
echo bridge > /etc/modules-load.d/pf9.conf
echo 8021q >> /etc/modules-load.d/pf9.conf
echo bonding >> /etc/modules-load.d/pf9.conf
echo br_netfilter >> /etc/modules-load.d/pf9.conf

echo net.ipv4.conf.all.rp_filter=0 >> /etc/sysctl.conf
echo net.ipv4.conf.default.rp_filter=0 >> /etc/sysctl.conf
echo net.bridge.bridge-nf-call-iptables=1 >> /etc/sysctl.conf
echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
echo net.ipv4.tcp_mtu_probing=2 >> /etc/sysctl.conf
sysctl -p

add-apt-repository 'deb http://platform9-neutron.s3-website-us-west-1.amazonaws.com ubuntu/'

apt-get -y --force-yes install openvswitch-switch
systemctl enable openvswitch-switch
systemctl start openvswitch-switch

ovs-vsctl add-br br-pf9

# so that hostname -f has the real hostname and not localhost otherwise pf9 displays host as localhost
sed -i 's/\(127.0.0.1\s*\)\(localhost\s*\)\(.*\)/\1 \3 \2/' /etc/hosts
