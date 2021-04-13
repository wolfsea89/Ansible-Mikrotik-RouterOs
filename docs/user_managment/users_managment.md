Konfiguracja Grup i użytkowników
=========


Czynności jakie wykonuje rola:

1. Konfiguracja group
  Przykładowa komenda:
    ```
      /user group add name=ansible policy=ssh,ftp,reboot,read,write,policy,password,web,api comment=""
    ```
2. Konfiguracja użytkownika
  Przykładowa komenda:
    ```
      /user add name=ansible group=ansible comment="Technical Account" address=10.0.0.0/24 disabled=no password="ansible"
    ```

Użycie roli
=========

```
- name: Configure Users Managment
  hosts: routeros
  vars:
    playbooks_roles_debug: true
  tasks:
    - include_role:
        name: Mikrotik-UsersManagment
      vars:
        input_role_groups:
          ansible:
            name: ansible
            policy:
              - ssh
              - ftp
              - reboot
              - read
              - write
              - policy
              - password
              - web
              - api
        input_role_users:
          ansible:
            name: ansible
            group: "ansible"
            comment: Technical Account
            address:
              - 10.0.0.0/24
              - 10.1.0.0/24
              - 10.2.0.0/24
              - 10.3.0.0/24
            password: ansible
```


[Powrót](../../README.md)