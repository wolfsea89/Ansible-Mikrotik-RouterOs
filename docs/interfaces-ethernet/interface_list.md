Konfiguracja interfejsów Bridge
=========

Przykład inventory:
```
inventory_group_routeros_list_interfaces:
  list_wan:
    name: LIST-WAN
    interfaces:
      - name: "WAN-01"
        comment: "WAN"
  list_lan_users:
    name: LIST-LAN-USERS
    interfaces:
      - name: "WiFi-LAN-01"
      - name: "WiFi-LAN-02"
        comment: "LAN-USERS"
  list_lan_admins:
    name: LIST-LAN-ADMINS
    interfaces:
      - name: "LAN-04"
        comment: "LAN-ADMINS"
  list_lan_proxmox:
    name: LIST-LAN-PROXMOX
    interfaces:
      - name: "LAN-01"
      - name: "LAN-02"
      - name: "LAN-03"
        comment: "LAN-PROXMOX"
```

Przykładowa komenda:
```
/interface list add name=LIST-WAN
/interface list member add comment=LAN-WAN interface=WAN-01 list=LIST-WAN
```

[Powrót](../../README.md)