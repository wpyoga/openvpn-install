#!/bin/bash

clear
echo 'Welcome to this OpenVPN road warrior installer!'
# @MERGE
. split-scripts/choose-ip.sh
# @MERGE
. split-scripts/choose-transport-protocol.sh
# @MERGE
. split-scripts/choose-port.sh
# @MERGE
. split-scripts/choose-dns.sh
# @MERGE
. split-scripts/choose-client-name.sh
echo
echo "OpenVPN installation is ready to begin."
# @MERGE
. split-scripts/firewall-install.sh
read -n1 -r -p "Press any key to continue..."
# @MERGE
. split-scripts/container-disable-limitnproc.sh
# @MERGE
. split-scripts/install-dependencies.sh
# @MERGE
. split-scripts/firewalld-enable.sh
# @MERGE
. split-scripts/generate-server-certs.sh
# @MERGE
. split-scripts/server.conf.sh
# @MERGE
. split-scripts/firewall-configure-forwarding.sh
# @MERGE
. split-scripts/selinux-config.sh
# If the server is behind NAT, use the correct IP address
[[ -n "$public_ip" ]] && ip="$public_ip"
# @MERGE
. multi-line-strings/client-common.txt.sh
# Enable and start the OpenVPN service
systemctl enable --now openvpn-server@server.service
# Generates the custom client.ovpn
new_client
echo
echo "Finished!"
echo
echo "The client configuration is available in:" ~/"$client.ovpn"
echo "New clients can be added by running this script again."
