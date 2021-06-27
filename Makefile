SPLIT_SCRIPTS = \
	openvpn-install-split.sh \
	split-scripts/nonexistent-openvpn-noindent.sh \
	split-scripts/utils-openvpn.sh \
	split-scripts/check-sanity.sh \
	split-scripts/detect-os.sh \
	split-scripts/existing-openvpn-noindent.sh \
	multi-line-strings/openvpn-iptables.service-ipv6.sh \
	multi-line-strings/disable-limitnproc.conf.sh \
	multi-line-strings/openvpn-iptables.service.sh \
	multi-line-strings/server.conf-2.sh \
	multi-line-strings/client-common.txt.sh \
	multi-line-strings/openvpn-iptables.service-tail.sh \
	multi-line-strings/server.conf.sh \
	multi-line-strings/dh.pem.sh \

all: openvpn-install-merged.sh

openvpn-install-merged.sh: $(SPLIT_SCRIPTS)
	merge-shell.sh openvpn-install-split.sh > openvpn-install-merged.sh

test: openvpn-install-merged.sh
	@diff -u openvpn-install.sh openvpn-install-merged.sh
	@echo "Test passed"

clean:
	rm -f openvpn-install-merged.sh
