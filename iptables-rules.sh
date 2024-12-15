#!/bin/zsh

# log invalid packets
iptables -A INPUT -m conntrack --ctstate INVALID -j LOG --log-prefix "iptables dropped packet (invalid): "
# log new connections (max 8 per minute)
iptables -A INPUT -i eth0 -m limit --limit 8/min -m conntrack --ctstate NEW -j LOG --log-prefix "iptables new connection: "

# allow established and related traffic in
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# allow http, https, dns (tcp), ssh (default and alternative), and git in
iptables -A INPUT -p tcp -m multiport --dports 80,443,53,22,2222,9418 -j ACCEPT
# allow dns (udp) in
iptables -A INPUT -p udp --dport 53 -j ACCEPT
# allow icmp in
iptables -A INPUT -p icmp -j ACCEPT
# allow loopback in
iptables -A INPUT -i lo -j ACCEPT
# drop invalid packets
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# allow http, https, dns (tcp), ssh (default and alternative), and git out
iptables -A OUTPUT -p tcp -m multiport --dports 80,443,53,22,2222,9418  -j ACCEPT
# allow dns (udp) out 
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
# allow new and established connections out
iptables -A OUTPUT -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# allow icmp out
iptables -A OUTPUT -p icmp -j ACCEPT
# allow loopback out
iptables -A OUTPUT -o lo -j ACCEPT

# allow forwarding for flightdeck
iptables -A FORWARD -p tcp -m multiport --dports 3333,4444,5555 -j ACCEPT

# port scanning drop (ineffective, needs to cover other types of port scans without restricting wanted traffic)
#iptables -N port-scanning
#iptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 5/s --limit-burst 10 -j RETURN
#iptables -A port-scanning -j DROP

# default restrictive policy
iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP
