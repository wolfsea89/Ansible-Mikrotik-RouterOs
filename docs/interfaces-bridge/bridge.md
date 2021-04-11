Konfiguracja interfejsów Bridge
=========



Czynności jakie wykonuje rola:

1. Konfiguracja interface
  Przykładowa komenda:
    ```
      /interface bridge add name="LAN-PROXMOX" comment="BRIDGE - Proxmox"
    ```
2. Ustawia porty dla interface
  Przykładowa komenda:
    ```
      /interface bridge port add bridge="LAN-PROXMOX" interface="LIST-LAN-PROXMOX" trusted=yes
    ```
2. Ustawia adress IP dla interface
    ```
      /ip address add address=10.0.0.4/24 interface=LAN-PROXMOX network=10.0.0.0
    ```
3. Ustawia graphing dla interface
    ```
      /tool graphing interface add
          interface=LAN-PROXMOX
          store-on-disk=no
          allow-address=10.0.0.0/8
    ```

Użycie roli
=========

```
- name: Mikrotik Bridge Interface
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-Interface-Bridge
      vars:
        input_role_ethernet_interfaces:
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
        input_role_debug: true
```


Przykład inventory:
```
inventory_host_routeros_bridges_interfaces:
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


[Powrót](../../README.md)