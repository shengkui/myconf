#!/bin/bash

# 禁止所有的 ip 访问本机的 Spark 端口（TCP）
iptables -I INPUT -p tcp --dport 8080 -j DROP
iptables -I INPUT -p tcp --dport 8081 -j DROP
iptables -I INPUT -p tcp --dport 7077 -j DROP
iptables -I INPUT -p tcp --dport 6066 -j DROP

# 允许特定 ip 访问本机的 Spark  端口（TCP）
ALLOW_IP_LIST=(127.0.0.1 172.21.73.37 172.21.84.18)
for ip in "${ALLOW_IP_LIST[@]}" ;do
    echo "=========== ${ip}"
    iptables -I INPUT -s ${ip} -p tcp --dport 8080 -j ACCEPT
    iptables -I INPUT -s ${ip} -p tcp --dport 8081 -j ACCEPT
    iptables -I INPUT -s ${ip} -p tcp --dport 7077 -j ACCEPT
    iptables -I INPUT -s ${ip} -p tcp --dport 6066 -j ACCEPT
done
