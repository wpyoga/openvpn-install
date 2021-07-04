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
. split-scripts/determine-firewall.sh
read -n1 -r -p "Press any key to continue..."
# @MERGE
. split-scripts/disable-container-limitnproc.sh
# @MERGE
. split-scripts/install-dependencies.sh
# @MERGE
. split-scripts/enable-firewalld.sh
# @MERGE
. split-scripts/generate-server-certs.sh
# @MERGE
. split-scripts/generate-server-config.sh
# @MERGE
. split-scripts/configure-ip-forwarding.sh
# @MERGE
. split-scripts/configure-selinux.sh
# @MERGE
. split-scripts/generate-client-common.txt.sh
# @MERGE
. split-scripts/start-openvpn-service.sh
# @MERGE
. split-scripts/generate-client-config.sh
echo
echo "Finished!"
echo
echo "The client configuration is available in:" ~/"$client.ovpn"
echo "New clients can be added by running this script again."
