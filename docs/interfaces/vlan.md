Konfiguracja interfejsów Bridge
=========

Przykład inventory:

Lista musi mieć przynajmniej dwa elementy :(
```
inventory_group_routeros_vlan_interfaces:
  default: # if one element in dictionary
  vlan_prod:
    name: VLAN-PROD
    interface: LAN-PROXMOX
    vlan_id: 10
    comment: "VLAN-PROD"
    address: "10.3.0.1/24"
    network: "10.3.0.0"
    graphing:
      allow_address: 0.0.0.0/0
      store_on_disk: "no"
```

Przykładowa komenda:
```
/interface vlan add     \
  comment=VLAN-PROD     \
  interface=LAN-PROXMOX \
  name=VLAN-PROD        \
  vlan-id=10
```