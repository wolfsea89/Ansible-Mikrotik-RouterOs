/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk mode=\
    dynamic-keys supplicant-identity=MikroTik wpa-pre-shared-key=\
    NiePamietamHasla wpa2-pre-shared-key=NiePamietamHasla
add authentication-types=wpa-psk,wpa2-psk mode=dynamic-keys name=\
    "Wybrzeze Klatki Schodowej" supplicant-identity=mr-rou-01 \
    wpa-pre-shared-key=NiePamietamHasla! wpa2-pre-shared-key=\
    NiePamietamHasla!
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-XX \
    comment="SSID: Wybrzeze Klatki Schodowej" disabled=no distance=indoors \
    frequency=auto installation=indoor mode=ap-bridge name=WiFi-LAN-01 \
    security-profile="Wybrzeze Klatki Schodowej" ssid=\
    "Wybrzeze Klatki Schodowej" station-roaming=enabled wireless-protocol=\
    802.11
set [ find default-name=wlan2 ] band=5ghz-a/n/ac channel-width=\
    20/40/80mhz-XXXX disabled=no distance=indoors frequency=auto \
    installation=indoor mode=ap-bridge name=WiFi-LAN-02 security-profile=\
    "Wybrzeze Klatki Schodowej" ssid="Wybrzeze Klatki Schodowej" \
    station-roaming=enabled wireless-protocol=802.11
/interface wireless manual-tx-power-table
set WiFi-LAN-01 comment="SSID: Wybrzeze Klatki Schodowej"
/interface wireless nstreme
set WiFi-LAN-01 comment="SSID: Wybrzeze Klatki Schodowej"
/ip pool
add comment="Users Network" name="Users Network Pool" ranges=\
    10.1.0.2-10.1.0.254
add comment="Admin Network" name="Admin Network Pool" ranges=\
    10.254.0.2-10.254.0.10
add comment="Prod Network Pool" name="Prod Network Pool" ranges=\
    10.2.0.2-10.2.0.254
/ip dhcp-server
add address-pool="Users Network Pool" disabled=no insert-queue-before=bottom \
    interface=LAN-Users name="Users Network DHCP"
add address-pool="Admin Network Pool" disabled=no interface=LAN-04 \
    lease-script="Admin Network" name="Admin Network DHCP"
add address-pool="Prod Network Pool" disabled=no interface=LAN-Prod name=\
    "Prod Network DHCP"
/snmp community
set [ find default=yes ] disabled=yes
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=prometheus policy="read,winbox,web,api,!local,!telnet,!ssh,!ftp,!rebo\
    ot,!write,!policy,!test,!password,!sniff,!sensitive,!romon,!dude,!tikapp"
/ip neighbor discovery-settings
set discover-interface-list=LIST-LAN-USERS
/interface list member
add comment="Admin Network" interface=LAN-04 list=LIST-LAN-ADMIN
add interface=WiFi-LAN-01 list=LIST-LAN-USERS
add comment=LAN-USERS interface=WiFi-LAN-02 list=LIST-LAN-USERS
add comment=LAN-WAN interface=WAN-01 list=LIST-WAN
add interface=LAN-01 list=LIST-LAN-PROD
add interface=LAN-02 list=LIST-LAN-PROD
add comment=LAN-PROD interface=LAN-03 list=LIST-LAN-PROD
/ip address
add address=10.0.0.1/24 interface=LAN-01 network=10.0.0.0
add address=10.254.0.1/24 comment="Admin Network" interface=LAN-04 network=\
    10.254.0.0
add address=10.0.0.2/24 interface=LAN-02 network=10.0.0.0
add address=10.0.0.3/24 interface=LAN-03 network=10.0.0.0
add address=10.0.0.4/24 interface=WiFi-LAN-01 network=10.0.0.0
add address=10.0.0.5/24 interface=WiFi-LAN-02 network=10.0.0.0
add address=10.1.0.1/24 comment="Users LAN Network" interface=LAN-Users \
    network=10.1.0.0
add address=10.2.0.1/16 comment="Prod LAN Network" interface=LAN-Prod \
    network=10.2.0.0
/ip dhcp-client
add comment=defconf disabled=no interface=WAN-01
/ip dhcp-server alert
add disabled=no interface=LAN-04 valid-server=00:00:00:00:00:00
/ip dhcp-server lease
add address=10.1.0.2 client-id=1:30:24:32:ba:55:3b mac-address=\
    30:24:32:BA:55:3B server="Users Network DHCP"
add address=10.1.0.254 client-id=1:ec:9c:32:5c:66:c8 mac-address=\
    EC:9C:32:5C:66:C8 server="Users Network DHCP"
add address=10.1.0.20 client-id=1:8:0:27:1b:c6:fe mac-address=\
    08:00:27:1B:C6:FE server="Users Network DHCP"
add address=10.1.0.21 mac-address=08:00:27:A0:F3:26 server=\
    "Users Network DHCP"
add address=10.1.0.22 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:5b:d9:1f:b:21:d3:5:2f mac-address=\
    08:00:27:50:45:E9 server="Users Network DHCP"
add address=10.1.0.23 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:d6:cc:3a:eb:66:17:15:10 mac-address=\
    08:00:27:3D:64:D4 server="Users Network DHCP"
add address=10.1.0.24 mac-address=08:00:27:65:4A:03 server=\
    "Users Network DHCP"
add address=10.1.0.25 client-id=1:8:0:27:e4:a7:48 mac-address=\
    08:00:27:E4:A7:48 server="Users Network DHCP"
add address=10.1.0.12 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:16:11:29:5d:9c:c3:c5:47 mac-address=\
    08:00:27:C9:AB:D9 server="Users Network DHCP"
add address=10.1.0.11 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:5:dc:f4:6b:d6:c4:22:74 mac-address=\
    08:00:27:BF:B7:30 server="Users Network DHCP"
add address=10.1.0.10 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:92:36:86:71:6e:3b:0:54 mac-address=\
    08:00:27:79:56:D1 server="Users Network DHCP"
add address=10.2.0.2 client-id=\
    ff:b6:22:f:eb:0:2:0:0:ab:11:91:c2:ca:8:0:66:69:8c mac-address=\
    C4:34:6B:55:2F:63 server="Prod Network DHCP"
add address=10.1.0.253 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:48:36:48:97:5b:bf:f9:8d mac-address=\
    08:00:27:93:88:32 server="Users Network DHCP"
add address=10.1.0.251 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:42:a9:b1:98:6d:ca:1d:53 mac-address=\
    08:00:27:B5:E4:C8 server="Users Network DHCP"
/ip dhcp-server network
add address=10.1.0.0/24 comment="Users Network " dns-server=10.1.0.1 gateway=\
    10.1.0.1
add address=10.2.0.0/16 comment="Prod Network" dns-server=10.2.0.1 gateway=\
    10.2.0.1
add address=10.254.0.0/24 comment="Admin Network" dns-server=10.254.0.1 \
    gateway=10.254.0.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d verify-doh-cert=yes
/ip dns static
add address=10.1.0.1 comment="Router Mikrotik" name=mr-rou-001.rachuna.net
add address=10.1.0.1 name=router.rachuna.net
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
/ip firewall filter
add action=drop chain=input comment="DHCP from WAN" in-interface-list=\
    LIST-WAN protocol=dccp
add action=reject chain=input comment="ssh from WAN" in-interface-list=\
    LIST-WAN protocol=tcp reject-with=icmp-network-unreachable src-port=22
add action=accept chain=input comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked disabled=yes
add action=drop chain=input comment="defconf: drop invalid" connection-state=\
    invalid disabled=yes
add action=accept chain=input comment="defconf: accept ICMP" disabled=yes \
    protocol=icmp
add action=accept chain=input comment=\
    "defconf: accept to local loopback (for CAPsMAN)" disabled=yes \
    dst-address=127.0.0.1
add action=drop chain=input comment="defconf: drop all not coming from LAN" \
    disabled=yes in-interface-list=!LIST-LAN-USERS
add action=accept chain=forward comment="defconf: accept in ipsec policy" \
    disabled=yes ipsec-policy=in,ipsec
add action=accept chain=forward comment="defconf: accept out ipsec policy" \
    disabled=yes ipsec-policy=out,ipsec
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" \
    connection-state=established,related disabled=yes
add action=accept chain=forward comment=\
    "defconf: accept established,related, untracked" connection-state=\
    established,related,untracked disabled=yes
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid disabled=yes
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new disabled=yes in-interface-list=LIST-WAN
add action=accept chain=forward
/ip firewall nat
add action=masquerade chain=srcnat comment="Users Network" ipsec-policy=\
    out,none out-interface-list=LIST-WAN src-address=10.1.0.0/24
add action=masquerade chain=srcnat comment="Prod Network" out-interface-list=\
    LIST-WAN src-address=10.2.0.0/16
/ip ipsec policy
set 0 disabled=yes
/ip service
set telnet disabled=yes
set ftp address=0.0.0.0/0 disabled=yes port=22
set www-ssl certificate=srv-rachuna.net disabled=no
set winbox disabled=yes
set api-ssl disabled=yes
/ip traffic-flow
set enabled=yes
/ip upnp
set enabled=yes
/system clock
set time-zone-name=Europe/Warsaw
/system identity
set name=mr-rou-001.rachuna.net
/system ntp client
set enabled=yes primary-ntp=194.146.251.100 secondary-ntp=194.146.251.101
/system upgrade mirror
set enabled=yes
/tool graphing interface
add interface=LAN-04 store-on-disk=no
add interface=LAN-Users store-on-disk=no
add interface=WAN-01 store-on-disk=no
add interface=LAN-Prod
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
