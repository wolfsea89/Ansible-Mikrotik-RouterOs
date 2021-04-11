Konfiguracja interfejsów Bridge
=========


Czynności jakie wykonuje rola:

1. konfiguracja vlan interface
  Przykładowa komenda:
    ```
      interface vlan add name=VLAN-PROD interface="LAN-PROXMOX" vlan-id=10 comment="VLAN-PROD"
    ```
2. Ustawia adress IP dla interface
    ```
      /ip address add address=10.0.0.4/24 interface=WiFi-LAN-01 network=10.0.0.0
    ```
3. Ustawia graphing dla interface
    ```
      /tool graphing interface add
          interface=WiFi-LAN-01
          store-on-disk=no
          allow-address=10.0.0.0/8
    ```


Użycie roli
=========

```
- name: Mikrotik Vlan Interface
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-Interface-VLan
      vars:
        input_role_vlan_interfaces:
          default: # if one element in dictionary
          vlan_prod:
            name: VLAN-PROD
            interface: LAN-PROXMOX
            vlan-id: 10
            comment: "VLAN-PROD"
            address: "10.3.0.1/24"
            network: "10.3.0.0"
            graphing:
              allow-address: 0.0.0.0/0
              store-on-disk: "no"
        input_role_debug: true
```

Przykład inventory:
Lista musi mieć przynajmniej dwa elementy :(
```
inventory_group_routeros_ethernet_interfaces:
  default: # if one element in dictionary
  vlan_prod:
    name: VLAN-PROD
    interface: LAN-PROXMOX
    vlan-id: 10
    comment: "VLAN-PROD"
    address: "10.3.0.1/24"
    network: "10.3.0.0"
    graphing:
      allow-address: 0.0.0.0/0
      store-on-disk: "no"
```

[Powrót](../../README.md)