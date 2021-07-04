echo
echo "What port should OpenVPN listen to?"
read -p "Port [1194]: " port
until [[ -z "$port" || "$port" =~ ^[0-9]+$ && "$port" -le 65535 ]]; do
	echo "$port: invalid port."
	read -p "Port [1194]: " port
done
[[ -z "$port" ]] && port="1194"
