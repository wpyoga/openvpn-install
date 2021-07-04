# If the server is behind NAT, use the correct IP address
[[ -n "$public_ip" ]] && ip="$public_ip"
# client-common.txt is created so we have a template to add further users later
# @MULTILINE
echo "client
dev tun
proto $protocol
remote $ip $port
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
auth SHA512
cipher AES-256-CBC
ignore-unknown-option block-outside-dns
block-outside-dns
verb 3" > /etc/openvpn/server/client-common.txt
# @MULTILINE-END
