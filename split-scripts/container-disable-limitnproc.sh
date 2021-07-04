# If running inside a container, disable LimitNPROC to prevent conflicts
if systemd-detect-virt -cq; then
	mkdir /etc/systemd/system/openvpn-server@server.service.d/ 2>/dev/null
	# @MERGE
	. multi-line-strings/disable-limitnproc.conf.sh
fi
