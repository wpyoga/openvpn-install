# Generate server.conf
# @MULTILINE
echo "local $ip
port $port
proto $protocol
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh.pem
auth SHA512
tls-crypt tc.key
topology subnet
server 10.8.0.0 255.255.255.0" > /etc/openvpn/server/server.conf
# @MULTILINE-END
# IPv6
if [[ -z "$ip6" ]]; then
	echo 'push "redirect-gateway def1 bypass-dhcp"' >> /etc/openvpn/server/server.conf
else
	echo 'server-ipv6 fddd:1194:1194:1194::/64' >> /etc/openvpn/server/server.conf
	echo 'push "redirect-gateway def1 ipv6 bypass-dhcp"' >> /etc/openvpn/server/server.conf
fi
echo 'ifconfig-pool-persist ipp.txt' >> /etc/openvpn/server/server.conf
# @MERGE
. split-scripts/generate-server-dns-config.sh
# @MULTILINE
echo "keepalive 10 120
cipher AES-256-CBC
user nobody
group $group_name
persist-key
persist-tun
verb 3
crl-verify crl.pem" >> /etc/openvpn/server/server.conf
# @MULTILINE-END
if [[ "$protocol" = "udp" ]]; then
	echo "explicit-exit-notify" >> /etc/openvpn/server/server.conf
fi
