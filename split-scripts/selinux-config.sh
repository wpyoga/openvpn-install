# If SELinux is enabled and a custom port was selected, we need this
if sestatus 2>/dev/null | grep "Current mode" | grep -q "enforcing" && [[ "$port" != 1194 ]]; then
	# Install semanage if not already present
	if ! hash semanage 2>/dev/null; then
		if [[ "$os_version" -eq 7 ]]; then
			# Centos 7
			yum install -y policycoreutils-python
		else
			# CentOS 8 or Fedora
			dnf install -y policycoreutils-python-utils
		fi
	fi
	semanage port -a -t openvpn_port_t -p "$protocol" "$port"
fi
