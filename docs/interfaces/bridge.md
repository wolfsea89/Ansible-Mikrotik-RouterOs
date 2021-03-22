Konfiguracja interfejsów Bridge
=========

Przykład inventory:
```
inventory_group_routeros_bridges_interfaces:
  lan_prod:
    name: "LAN-PROXMOX"           # Interface Bridge Name
    comment: "BRIDGE - Proxmox"   # Comment
    address: "10.2.0.1/16"        # Address
    network: "10.2.0.0"           # Network
    graphing:                     # Enable graphing (optional)
      allow_address: 0.0.0.0/0    # Allow address do graphing
      store_on_disk: "no"         # Store data on disk
    other_params: ""              # Optional
    interfaces:                   # Interface list
      - name: LIST-LAN-PROXMOX    #   Interface name
        trusted: "yes"            #   Is inteface trusted?
  lan_users:
    name: "LAN-Users"
    comment: "BRIDGE - Users"
    address: "10.1.0.1/24"
    network: "10.1.0.0"
    graphing:
      allow_address: 0.0.0.0/0
      store_on_disk: "no"
    interfaces:
      - name: LIST-LAN-USERS
        trusted: "no"
```

Przykładowa komenda:
```
/interface bridge add comment="BRIDGE - Proxmox" name=LAN-PROXMOX trusted=yes
```