Konfiguracja usługi ntp
=========

Czynności jakie wykonuje rola:

1. konfiguracja strefy czasowej
  ```
  /system clock set time-zone-name=Europe/Warsaw
  ```
2. Konfiguracja klienta ntp
  ```
  /system ntp client set enabled=yes primary-ntp=194.146.251.100 secondary-ntp=194.146.251.101
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
- name: Mikrotik NTP Client
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-NTP-Client
      vars:
        input_role_ntp_client:
          time_zone_name: "Europe/Warsaw"
          primary_ntp: "194.146.251.100"
          secondary_ntp: "194.146.251.101"
```


[Powrót](../../README.md)