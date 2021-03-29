Konfigurowanie serwera dhcp
=========

Czynności jakie wykonuje rola:

1. konfiguracja puli
  ```
  /ip pool add comment="Users Network Pool" name=users-network-pool ranges=10.1.0.2-10.1.0.254

  ```
2. Konfiguracja serwera dhcp
  ```
  /ip dhcp-server add address-pool=admins-network-pool disabled=no interface=LAN-04 name=admins-network-dhcp
  ```
3. Konfiguracja sieci dla serwera dhcp
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
- name: Graphing
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-Graphing
      vars:
        input_role_graphing:
          store_every: "24hours"
```


[Powrót](../../README.md)