Konfigurowanie serwera dhcp
=========

Czynności jakie wykonuje rola:

1. konfiguracja puli
    Przykładowa komenda:
    ```
      /ip pool add comment="Users Network Pool" name=users-network-pool ranges=10.1.0.2-10.1.0.254
    ```
2. Konfiguracja serwera dhcp
    Przykładowa komenda:
    ```
      /ip dhcp-server add address-pool=admins-network-pool disabled=no interface=LAN-04 name=admins-network-dhcp
    ```
3. Konfiguracja sieci dla serwera dhcp
    Przykładowa komenda:
    ```
      /ip dhcp-server network add            \
        address=10.1.0.0/24                  \
        boot-file-name=/tftpboot/pxelinux.0  \
        comment="Users Network"              \
        dns-server=10.1.0.1                  \
        domain=rachuna.net                   \
        gateway=10.1.0.1                     \
        next-server=10.3.0.1                 \
    ```
4. Konfiguracja static ip dla klientóôw
    Przykładowa komenda:
    ```
    /ip dhcp-server lease add address=10.1.0.10 client-id=1:30:24:32:ba:55:3b mac-address=30:24:32:BA:55:3B server=users-network-dhcp
    ```

Użycie roli
=========

```
- name: DHCP Server
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-DHCP-Server
      vars:
        input_role_pools:
          defaults:
          users_network_pool:
            name: "users-network-pool"
            comment: "Users Network Pool"
            ranges: "10.1.0.2-10.1.0.254"
        input_role_dhcp_servers:
          defaults:
          users_network_dhcp:
            name: "users-network-dhcp"
            interface: "LAN-Users"
            address-pool: "users-network-pool"
            insert-queue-before: bottom
        input_role_dhcp_network:
          defaults:
          users_network_dhcp:
            address: "10.1.0.0/24"
            comment: "Users Network"
            dns-server: "10.1.0.1"
            gateway: "10.1.0.1"
            domain: "rachuna.net"
        input_role_dhcp_leaves:
          mr-vm-002:
            client-id: 1:a4:b1:c1:9:66:72
            address: 10.1.0.2
            mac-address: A4:B1:C1:09:66:72
            server: users-network-dhcp
          mr-vm-100:
            client-id: 1:8:0:27:a7:ee:e4
            address: 10.1.0.100
            mac-address: 08:00:27:A7:EE:E4
            server: users-network-dhcp
```


[Powrót](../../README.md)