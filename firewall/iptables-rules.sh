iptables -A INPUT -m conntrack --ctstate INVALID -j LOG --log-prefix "dropped packet (invalid): "
iptables -A INPUT -i eth0 -m limit --limit 8/min -m conntrack --ctstate NEW -j LOG --log-prefix "new connection: "

iptables -A INPUT -p tcp -m multiport --dports 80,443,53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 80,443,53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 22,2222 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 22,2222 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -A FORWARD -p tcp -m multiport --dports 3333,4444,5555 -j ACCEPT

iptables -N port-scanning
iptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURN
iptables -A port-scanning -j DROP

iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP
