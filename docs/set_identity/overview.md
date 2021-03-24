Ustawienie nazwy routera
=========

Czynności jakie wykonuje rola:

1. Ustawienie nazwy routera
  ```
  /system identity set name="router.rachuna.net"
  ```

Konfiguracja komunikacji z mikrotikiem
=========
inventories/example/host_vars/router.rachuna.net.yml
```
ansible_host: 10.0.0.1
ansible_connection: network_cli
ansible_network_os: routeros
ansible_user: ansible
ansible_become: yes
ansible_ssh_pass: "<< password >>"
```

Użycie roli
=========

```
- name: Create backup
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-SetIdentity
      vars:
        input_role_ansible_host:     "router.rachuna.net"
```


[Powrót](../../README.md)