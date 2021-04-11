Konfiguracja interfejsów Ethernet
=========


Czynności jakie wykonuje rola:

1. konfiguracja interface
  Przykładowa komenda:
    ```
      /interface ethernet set [ find default-name=ether2 ] name=LAN-01
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
- name: Mikrotik Ethernet Interface
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-Interface-Ethernet
      vars:
        input_role_ethernet_interfaces:
          ether1:
            name: "WAN-01"
            comment: "WAN-01"
            graphing:
              allow-address: 0.0.0.0/0
              store-on-disk: "no"
            other_params: ""
          ether2:
            name: "LAN-01"
            comment: ""
            address: "10.0.0.1/24"
            network: "10.0.0.0"
            graphing:
              allow-address: 0.0.0.0/0
              store-on-disk: "no"
          ether3:
            name: "LAN-02"
            comment: ""
            address: "10.0.0.2/24"
            network: "10.0.0.0"
            graphing:
              allow-address: 0.0.0.0/0
              store-on-disk: "no"
          ether4:
            name: "LAN-03"
            comment: ""
            address: "10.0.0.3/24"
            network: "10.0.0.0"
            graphing:
              allow-address: 0.0.0.0/0
              store-on-disk: "no"
          ether5:
            name: "LAN-04"
            comment: "LAN-04 - Admins Network"
            address: "10.254.0.1/24"
            network: "10.254.0.1"
            graphing:
              allow-address: 0.0.0.0/0
              store-on-disk: "no"
        input_role_debug: true
```

Przykład inventory:
```
inventory_host_routeros_ethernet_interfaces:
  ether1:                        # Default name interface
    name: "WAN-01"               # New name interface
    comment: "WAN-01"            # Comment
    graphing:                    # Enable graphing (optional)
      allow-address: 0.0.0.0/0   # Allow address do graphing
      store-on-disk: "no"        # Store data on disk
    other_params: ""             # Optional
  ether2:
    name: "LAN-01"
    comment: ""
    address: "10.0.0.1/24"
    network: "10.0.0.0"
    graphing:
      allow-address: 0.0.0.0/0
      store-on-disk: "no"
  ether3:
    name: "LAN-02"
    comment: ""
    address: "10.0.0.2/24"
    network: "10.0.0.0"
    graphing:
      allow-address: 0.0.0.0/0
      store-on-disk: "no"
  ether4:
    name: "LAN-03"
    comment: ""
    address: "10.0.0.3/24"
    network: "10.0.0.0"
    graphing:
      allow-address: 0.0.0.0/0
      store-on-disk: "no"
  ether5:
    name: "LAN-04"
    comment: "LAN-04 - Admins Network"
    address: "10.254.0.1/24"
    network: "10.254.0.1"
    graphing:
      allow-address: 0.0.0.0/0
      store-on-disk: "no"
```

[Powrót](../../README.md)