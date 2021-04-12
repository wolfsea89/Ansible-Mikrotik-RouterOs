/snmp community
set [ find default=yes ] disabled=yes
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=prometheus policy="read,web,api,!local,!telnet,!ssh,!ftp,!reboot,!wri\
    te,!policy,!test,!winbox,!password,!sniff,!sensitive,!romon,!dude,!tikapp"
add name=ansible policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,wi\
    nbox,password,web,sniff,sensitive,api,romon,dude,tikapp"
/ip neighbor discovery-settings
set discover-interface-list=LIST-LAN-USERS
/ip cloud
set ddns-enabled=yes ddns-update-interval=1h
/ip dhcp-server alert
add disabled=no interface=LAN-04 valid-server=00:00:00:00:00:00
add disabled=no interface=LAN-Users valid-server=00:00:00:00:00:00
/ip firewall address-list
add address=83.243.104.9 list=router.rachuna.net
/ip firewall filter
add action=drop chain=input comment="DHCP from WAN" in-interface-list=\
    LIST-WAN protocol=dccp
add action=reject chain=input comment="FTP-DATA from WAN" dst-port=20 \
    in-interface-list=LIST-WAN protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=reject chain=input comment="FTP from WAN" dst-port=21 \
    in-interface-list=LIST-WAN protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=reject chain=input comment="SSH from WAN" dst-port=22 \
    in-interface-list=LIST-WAN log=yes protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=reject chain=input comment="Telnet from WAN" dst-port=23 \
    in-interface-list=LIST-WAN protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=reject chain=input comment="SMTP from WAN" dst-port=25 \
    in-interface-list=LIST-WAN protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=reject chain=input comment="DNS from WAN" dst-port=53 \
    in-interface-list=LIST-WAN protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=reject chain=input comment="HTTP from WAN" dst-port=80 \
    in-interface-list=LIST-WAN protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=reject chain=input comment="Windbox from WAN" dst-port=8291 \
    in-interface-list=LIST-WAN protocol=tcp reject-with=\
    icmp-network-unreachable src-port=""
add action=drop chain=input comment="drop invalid" connection-state=invalid
add action=fasttrack-connection chain=forward comment=fasttrack \
    connection-state=established,related
add action=accept chain=input comment="accept established,related,untracked" \
    connection-state=established,related,untracked
add action=accept chain=forward comment=\
    "forward established,related,untracked" connection-state=\
    established,related,untracked
add action=accept chain=input comment="defconf: accept ICMP" disabled=yes \
    protocol=icmp
add action=accept chain=input comment=\
    "defconf: accept to local loopback (for CAPsMAN)" disabled=yes \
    dst-address=127.0.0.1
add action=accept chain=forward comment="defconf: accept in ipsec policy" \
    disabled=yes ipsec-policy=in,ipsec
add action=accept chain=forward comment="defconf: accept out ipsec policy" \
    disabled=yes ipsec-policy=out,ipsec
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new disabled=yes in-interface-list=LIST-WAN
add action=accept chain=forward comment="Forward from WAN" disabled=yes
/ip firewall nat
add action=masquerade chain=srcnat comment="Users Network" \
    out-interface-list=LIST-WAN src-address=10.1.0.0/24
add action=masquerade chain=srcnat comment="Proxmox Network" \
    out-interface-list=LIST-WAN src-address=10.2.0.0/24
add action=masquerade chain=srcnat comment="Prod Network" out-interface-list=\
    LIST-WAN src-address=10.3.0.0/24
/ip ipsec policy
set 0 disabled=yes
/ip service
set telnet disabled=yes
set ftp address=0.0.0.0/0 disabled=yes port=22
set www-ssl address=\
    10.0.0.0/24,10.1.0.0/24,10.2.0.0/24,10.3.0.0/24,10.254.0.0/24,0.0.0.0/0 \
    certificate=router.rachuna.net disabled=no
set api disabled=yes
set winbox disabled=yes
/ip traffic-flow
set enabled=yes
/ip upnp
set enabled=yes
/system clock
set time-zone-name=Europe/Warsaw
/system ntp client
set enabled=yes primary-ntp=194.146.251.100 secondary-ntp=194.146.251.101
/system upgrade mirror
set enabled=yes
/tool graphing
set store-every=24hours
/tool graphing interface
/tool graphing queue
add store-on-disk=no
/tool graphing resource
add store-on-disk=no
/tool mac-server
set allowed-interface-list=LIST-LAN-USERS
/tool mac-server mac-winbox
set allowed-interface-list=LIST-LAN-USERS
/tool traffic-monitor
add interface=LAN-Users name=tmon1 threshold=0