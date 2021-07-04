#!/bin/bash
#
# https://github.com/Nyr/openvpn-install
#
# Copyright (c) 2013 Nyr. Released under the MIT License.


# @MERGE
. split-scripts/detect-os.sh

# @MERGE
. split-scripts/check-requirements.sh

# @MERGE
. split-scripts/utils-openvpn.sh

if [[ ! -e /etc/openvpn/server/server.conf ]]; then
	# @MERGE
	. split-scripts/nonexistent-openvpn.sh
else
	# @MERGE
	. split-scripts/existing-openvpn.sh
fi
