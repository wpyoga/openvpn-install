echo
echo "Which protocol should OpenVPN use?"
echo "   1) UDP (recommended)"
echo "   2) TCP"
read -p "Protocol [1]: " protocol
until [[ -z "$protocol" || "$protocol" =~ ^[12]$ ]]; do
	echo "$protocol: invalid selection."
	read -p "Protocol [1]: " protocol
done
case "$protocol" in
	1|"") 
	protocol=udp
	;;
	2) 
	protocol=tcp
	;;
esac
