Konfiguracja interfejsów Bridge
=========

Przykład inventory:
```
input_role_bridges_interfaces:
  lan_prod:
    name: "LAN-PROXMOX"           # Interface Bridge Name
    comment: "BRIDGE - Proxmox"   # Comment
    address: "10.2.0.1/16"        # Address
    network: "10.2.0.0"           # Network
    graphing:                     # Enable graphing (optional)
      allow-address: 0.0.0.0/0    # Allow address do graphing
      store-on_disk: "no"         # Store data on disk
    other-params: ""              # Optional
    interfaces:                   # Interface list
      - name: LIST-LAN-PROXMOX    #   Interface name
        trusted: "yes"            #   Is inteface trusted?
  lan_users:
    name: "LAN-Users"
    comment: "BRIDGE - Users"
    address: "10.1.0.1/24"
    network: "10.1.0.0"
    graphing:
      allow-address: 0.0.0.0/0
      store-on-disk: "no"
    interfaces:
      - name: LIST-LAN-USERS
        trusted: "no"
```

Przykładowa komenda:
```
/interface bridge add comment="BRIDGE - Proxmox" name=LAN-PROXMOX
/interface bridge port add bridge="LAN-Users" interface="LIST-LAN-USERS" trusted=no",
/ip address add address=10.1.0.1/24 interface=LAN-PROXMOX network=10.1.0.0
```

[Powrót](../../README.md)