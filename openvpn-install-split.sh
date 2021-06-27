#!/bin/bash
#
# https://github.com/Nyr/openvpn-install
#
# Copyright (c) 2013 Nyr. Released under the MIT License.


# @MERGE
. split-scripts/detect-os.sh
. split-scripts/check-sanity.sh

# @MERGE
. split-scripts/utils-openvpn.sh

if [[ ! -e /etc/openvpn/server/server.conf ]]; then
# @MERGE t 1
. split-scripts/nonexistent-openvpn-noindent.sh
else
# @MERGE t 1
. split-scripts/existing-openvpn-noindent.sh
fi
