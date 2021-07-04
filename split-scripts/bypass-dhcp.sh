# IPv6
if [[ -z "$ip6" ]]; then
	echo 'push "redirect-gateway def1 bypass-dhcp"' >> /etc/openvpn/server/server.conf
else
	echo 'server-ipv6 fddd:1194:1194:1194::/64' >> /etc/openvpn/server/server.conf
	echo 'push "redirect-gateway def1 ipv6 bypass-dhcp"' >> /etc/openvpn/server/server.conf
fi
