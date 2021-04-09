Ustawienie nazwy routera
=========

Czynności jakie wykonuje rola:

1. Ustawienie nazwy routera
  Przykładowa komenda:
  ```
    /system identity set name="router.rachuna.net"
    /system identity print
  ```

Użycie roli
=========

```
- name: Mikrotik Set Identitiy
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-SetIdentity
      vars:
        input_role_ansible_host:     "router.rachuna.net"
        input_role_debug:            true
```


[Powrót](../../README.md)