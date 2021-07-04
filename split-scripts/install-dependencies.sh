if [[ "$os" = "debian" || "$os" = "ubuntu" ]]; then
	apt-get update
	apt-get install -y openvpn openssl ca-certificates $firewall
elif [[ "$os" = "centos" ]]; then
	yum install -y epel-release
	yum install -y openvpn openssl ca-certificates tar $firewall
else
	# Else, OS must be Fedora
	dnf install -y openvpn openssl ca-certificates tar $firewall
fi
