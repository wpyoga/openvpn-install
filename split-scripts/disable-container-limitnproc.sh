# If running inside a container, disable LimitNPROC to prevent conflicts
if systemd-detect-virt -cq; then
	mkdir /etc/systemd/system/openvpn-server@server.service.d/ 2>/dev/null
	# @MULTILINE
	echo "[Service]
LimitNPROC=infinity" > /etc/systemd/system/openvpn-server@server.service.d/disable-limitnproc.conf
	# @MULTILINE-END
fi
