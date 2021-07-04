# @MERGE
. multi-line-strings/server.conf.sh
# @MERGE
. split-scripts/bypass-dhcp.sh
echo 'ifconfig-pool-persist ipp.txt' >> /etc/openvpn/server/server.conf
# @MERGE
. split-scripts/dns-config.sh
# @MERGE
. multi-line-strings/server.conf-2.sh
if [[ "$protocol" = "udp" ]]; then
	echo "explicit-exit-notify" >> /etc/openvpn/server/server.conf
fi
