Konfigurowanie klienta dhcp
=========

Czynności jakie wykonuje rola:

1. konfiguracja klienta dhcp
  Przykładowa komenda:
  ```
    /ip pool add comment="Users Network Pool" name=users-network-pool ranges=10.1.0.2-10.1.0.254

  ```

Użycie roli
=========

```
- name: DHCP Client
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-DHCP-Client
      vars:
        input_role_debug: true
        input_role_dhcp_clients:
          - comment: "WAN-01"
            interface: "WAN-01"
```


[Powrót](../../README.md)