Konfiguracja interfejsów Ethernet
=========

Przykład inventory:
```
inventory_group_routeros_ethernet_interfaces:
  ether1:                        # Default name interface
    name: "WAN-01"               # New name interface
    comment: "WAN-01"            # Comment
    graphing:                    # Enable graphing (optional)
      allow_address: 0.0.0.0/0   # Allow address do graphing
      store_on_disk: "no"        # Store data on disk
    other_params: ""             # Optional
  ether2:
    name: "LAN-01"
    comment: ""
    address: "10.0.0.1/24"
    network: "10.0.0.0"
    graphing:
      allow_address: 0.0.0.0/0
      store_on_disk: "no"
  ether3:
    name: "LAN-02"
    comment: ""
    address: "10.0.0.2/24"
    network: "10.0.0.0"
    graphing:
      allow_address: 0.0.0.0/0
      store_on_disk: "no"
  ether4:
    name: "LAN-03"
    comment: ""
    address: "10.0.0.3/24"
    network: "10.0.0.0"
    graphing:
      allow_address: 0.0.0.0/0
      store_on_disk: "no"
  ether5:
    name: "LAN-04"
    comment: "LAN-04 - Admins Network"
    address: "10.254.0.1/24"
    network: "10.254.0.1"
    graphing:
      allow_address: 0.0.0.0/0
      store_on_disk: "no"
```

Przykładowa komenda:
```
/interface ethernet set [ find default-name=ether2 ] name=LAN-01
```

[Powrót](../../README.md)