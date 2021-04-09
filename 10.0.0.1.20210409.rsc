/interface bridge
add comment="BRIDGE - Proxmox" name=LAN-PROXMOX
add comment="BRIDGE - Users" name=LAN-Users
/interface vlan
add comment=VLAN-PROD interface=LAN-PROXMOX name=VLAN-PROD vlan-id=10
/interface list
add name=LIST-WAN
add name=LIST-LAN-USERS
add name=LIST-LAN-PROXMOX
add name=LIST-LAN-ADMINS
/ip pool
add comment="Users Network Pool" name=users-network-pool ranges=\
    10.1.0.2-10.1.0.254
add comment="Admins Network Pool" name=admins-network-pool ranges=\
    10.254.0.2-10.254.0.10
add comment="Prod Network Pool" name=prod-network-pool ranges=\
    10.3.0.2-10.3.0.254
add comment="Proxmox Network Pool" name=proxmox-network-pool ranges=\
    10.2.0.2-10.2.0.254
/ip dhcp-server
add address-pool=admins-network-pool disabled=no interface=LAN-04 name=\
    admins-network-dhcp
add address-pool=proxmox-network-pool disabled=no interface=LAN-PROXMOX name=\
    proxmox-network-dhcp
add address-pool=users-network-pool disabled=no insert-queue-before=bottom \
    interface=LAN-Users lease-time=23h59m59s name=users-network-dhcp
add address-pool=prod-network-pool disabled=no insert-queue-before=bottom \
    interface=VLAN-PROD name=prod-network-dhcp
/snmp community
set [ find default=yes ] disabled=yes
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=prometheus policy="read,web,api,!local,!telnet,!ssh,!ftp,!reboot,!wri\
    te,!policy,!test,!winbox,!password,!sniff,!sensitive,!romon,!dude,!tikapp"
add name=ansible policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,wi\
    nbox,password,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=LAN-Users interface=LIST-LAN-USERS
add bridge=LAN-PROXMOX interface=LIST-LAN-PROXMOX trusted=yes
/ip neighbor discovery-settings
set discover-interface-list=LIST-LAN-USERS
/interface list member
add interface=WiFi-LAN-01 list=LIST-LAN-USERS
add comment=LAN-USERS interface=WiFi-LAN-02 list=LIST-LAN-USERS
add comment=LAN-WAN interface=WAN-01 list=LIST-WAN
add interface=LAN-01 list=LIST-LAN-PROXMOX
add interface=LAN-02 list=LIST-LAN-PROXMOX
add comment=LAN-PROD interface=LAN-03 list=LIST-LAN-PROXMOX
add comment=LAN-ADMINS interface=LAN-04 list=LIST-LAN-ADMINS
/ip address
add address=10.1.0.1/24 comment="BRIDGE - Users" interface=LAN-Users network=\
    10.1.0.0
add address=10.2.0.1/24 comment="BRIDGE - Proxmox" interface=LAN-PROXMOX \
    network=10.2.0.0
add address=10.2.0.1/16 comment="BRIDGE - Proxmox" interface=LAN-PROXMOX \
    network=10.2.0.0
add address=10.3.0.1/24 comment=VLAN-PROD interface=VLAN-PROD network=\
    10.3.0.0
/ip cloud
set ddns-enabled=yes ddns-update-interval=1h
/ip dhcp-client
add comment="WAN-01 - VECTRA" disabled=no interface=WAN-01
/ip dhcp-server alert
add disabled=no interface=LAN-04 valid-server=00:00:00:00:00:00
add disabled=no interface=LAN-Users valid-server=00:00:00:00:00:00
/ip dhcp-server lease
add address=10.1.0.10 client-id=1:30:24:32:ba:55:3b mac-address=\
    30:24:32:BA:55:3B server=users-network-dhcp
add address=10.1.0.50 client-id=1:f8:ac:65:29:6e:72 mac-address=\
    F8:AC:65:29:6E:72 server=users-network-dhcp
add address=10.2.0.2 client-id=\
    ff:6b:55:2f:63:0:1:0:1:27:dd:36:e2:c4:34:6b:55:2f:63 mac-address=\
    C4:34:6B:55:2F:63 server=proxmox-network-dhcp
add address=10.1.0.150 client-id=1:9c:28:f7:8c:99:2c mac-address=\
    9C:28:F7:8C:99:2C server=users-network-dhcp
add address=10.1.0.200 client-id=1:ec:9c:32:5c:66:c8 mac-address=\
    EC:9C:32:5C:66:C8 server=users-network-dhcp
add address=10.3.0.2 client-id=\
    ff:ca:53:9:5a:0:2:0:0:ab:11:df:24:e1:73:8a:46:af:37 mac-address=\
    06:7B:D4:04:D0:3C server=prod-network-dhcp
add address=10.1.0.151 client-id=1:7a:a8:ef:2a:6c:e5 mac-address=\
    7A:A8:EF:2A:6C:E5 server=users-network-dhcp
add address=10.3.0.3 client-id=\
    ff:ca:53:9:5a:0:2:0:0:ab:11:e9:f6:ef:9d:1f:1f:88:4a mac-address=\
    6E:9A:F4:89:42:E5 server=prod-network-dhcp
add address=10.1.0.2 client-id=1:a4:b1:c1:9:66:72 mac-address=\
    A4:B1:C1:09:66:72 server=users-network-dhcp
add address=10.1.0.100 client-id=1:8:0:27:66:7d:7 mac-address=\
    08:00:27:66:7D:07 server=users-network-dhcp
/ip dhcp-server network
add address=10.1.0.0/24 boot-file-name=/tftpboot/pxelinux.0 comment=\
    "Users Network" dns-server=10.1.0.1 domain=rachuna.net gateway=10.1.0.1 \
    next-server=10.3.0.1
add address=10.2.0.0/24 boot-file-name=/tftpboot/pxelinux.0 comment=\
    "Proxmox Network" dns-server=10.2.0.1 domain=rachuna.net gateway=10.2.0.1 \
    next-server=10.3.0.1
add address=10.3.0.0/24 boot-file-name=/tftpboot/pxelinux.0 comment=\
    "Proxmox Network" dns-server=10.3.0.1 domain=rachuna.net gateway=10.3.0.1 \
    next-server=10.3.0.1
add address=10.254.0.0/24 boot-file-name=/tftpboot/pxelinux.0 comment=\
    "Admin Network" dns-server=10.254.0.1 domain=rachuna.net gateway=\
    10.254.0.1 next-server=10.3.0.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d servers=8.8.8.8,4.4.4.4 \
    verify-doh-cert=yes
/ip dns static
add address=10.0.0.1 comment="Router Mikrotik" name=mr-rou-001.rachuna.net
add address=10.0.0.1 name=router.rachuna.net
add address=10.2.0.1 comment="Network Prod - Router" name=\
    mr-rou-001.rachuna.pl
add address=10.2.0.1 name=router.rachuna.net
add address=10.2.0.2 comment="Network Prod - Kubernetes" name=\
    mr-kube-02.rachuna.net
add address=10.2.0.2 name=jenkins.k8s.rachuna.net
add address=10.2.0.2 name=kubernetes-dashboard.k8s.rachuna.net
add address=10.2.0.2 name=gitlab.k8s.rachuna.net
add address=10.1.0.251 name=jenkins-slave-251.rachuna.net
add address=10.1.0.253 name=jenkins-master-253.rachuna.net
add address=10.2.0.2 comment="Network proxmox" name=proxmox-002.rachuna.net
add address=10.3.0.2 comment="Prod network" name=docker-002.rachuna.net
add address=10.3.0.2 name=pxe.rachuna.net
add address=10.3.0.2 name=jenkins.rachuna.net
add address=10.3.0.3 name=jenkins-slave-003.rachuna.net
add address=10.1.0.2 comment=mr-vm-002 name=mr-vm-002.rachuna.net
add address=10.1.0.100 comment=mr-vm-100 name=mr-vm-100.rachuna.net
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
add interface=LAN-Users store-on-disk=no
add interface=LAN-PROXMOX store-on-disk=no
add interface=VLAN-PROD store-on-disk=no
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
