#!/bin/bash
#
# https://github.com/Nyr/openvpn-install
#
# Copyright (c) 2013 Nyr. Released under the MIT License.


# @MERGE
. main-script-parts/detect-os.sh

# @MERGE
. main-script-parts/check-requirements.sh

# @MERGE
. main-script-parts/util-functions.sh

if [[ ! -e /etc/openvpn/server/server.conf ]]; then
	# @MERGE
	. main-script-parts/install-openvpn.sh
else
	# @MERGE
	. main-script-parts/choose-action.sh
	case "$option" in
		1)
			# @MERGE
			. split-scripts/add-client.sh
			exit
		;;
		2)
			# @MERGE
			. split-scripts/revoke-client.sh
			exit
		;;
		3)
			# @MERGE
			. split-scripts/uninstall-openvpn.sh
			exit
		;;
		4)
			exit
		;;
	esac
fi
