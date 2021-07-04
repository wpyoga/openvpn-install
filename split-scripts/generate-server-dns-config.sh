# DNS
case "$dns" in
	1|"")
		# Locate the proper resolv.conf
		# Needed for systems running systemd-resolved
		if grep -q '^nameserver 127.0.0.53' "/etc/resolv.conf"; then
			resolv_conf="/run/systemd/resolve/resolv.conf"
		else
			resolv_conf="/etc/resolv.conf"
		fi
		# Obtain the resolvers from resolv.conf and use them for OpenVPN
		grep -v '^#\|^;' "$resolv_conf" | grep '^nameserver' | grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}' | while read line; do
			echo "push \"dhcp-option DNS $line\"" >> /etc/openvpn/server/server.conf
		done
	;;
	2)
		echo 'push "dhcp-option DNS 8.8.8.8"' >> /etc/openvpn/server/server.conf
		echo 'push "dhcp-option DNS 8.8.4.4"' >> /etc/openvpn/server/server.conf
	;;
	3)
		echo 'push "dhcp-option DNS 1.1.1.1"' >> /etc/openvpn/server/server.conf
		echo 'push "dhcp-option DNS 1.0.0.1"' >> /etc/openvpn/server/server.conf
	;;
	4)
		echo 'push "dhcp-option DNS 208.67.222.222"' >> /etc/openvpn/server/server.conf
		echo 'push "dhcp-option DNS 208.67.220.220"' >> /etc/openvpn/server/server.conf
	;;
	5)
		echo 'push "dhcp-option DNS 9.9.9.9"' >> /etc/openvpn/server/server.conf
		echo 'push "dhcp-option DNS 149.112.112.112"' >> /etc/openvpn/server/server.conf
	;;
	6)
		echo 'push "dhcp-option DNS 94.140.14.14"' >> /etc/openvpn/server/server.conf
		echo 'push "dhcp-option DNS 94.140.15.15"' >> /etc/openvpn/server/server.conf
	;;
esac
