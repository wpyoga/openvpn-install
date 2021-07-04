echo
echo "Select a DNS server for the clients:"
echo "   1) Current system resolvers"
echo "   2) Google"
echo "   3) 1.1.1.1"
echo "   4) OpenDNS"
echo "   5) Quad9"
echo "   6) AdGuard"
read -p "DNS server [1]: " dns
until [[ -z "$dns" || "$dns" =~ ^[1-6]$ ]]; do
	echo "$dns: invalid selection."
	read -p "DNS server [1]: " dns
done
