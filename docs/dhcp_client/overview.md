Konfigurowanie klienta dhcp
=========

Czynności jakie wykonuje rola:

1. konfiguracja klienta dhcp
  ```
  /ip pool add comment="Users Network Pool" name=users-network-pool ranges=10.1.0.2-10.1.0.254

  ```

Konfiguracja komunikacji z mikrotikiem
=========
inventories/example/host_vars/router.rachuna.net.yml
```
ansible_host: 10.0.0.1
ansible_connection: network_cli
ansible_network_os: routeros
ansible_user: user_tech
ansible_become: yes
ansible_ssh_pass: "<< password >>"
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
        input_role_dhcp_clients:
          - comment: "WAN-01"
            interface: "WAN-01"
```


[Powrót](../../README.md)