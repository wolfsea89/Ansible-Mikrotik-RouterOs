Konfiguracja usługi ntp
=========

Czynności jakie wykonuje rola:

1. konfiguracja strefy czasowej
  Przykładowa komenda:
  ```
    /system clock set time-zone-name=Europe/Warsaw
  ```
2. Konfiguracja klienta ntp
  Przykładowa komenda:
  ```
    /system ntp client set enabled=yes primary-ntp=194.146.251.100 secondary-ntp=194.146.251.101
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
          time-zone-name: "Europe/Warsaw"
          primary-ntp: "194.146.251.100"
          secondary-ntp: "194.146.251.101"
```


[Powrót](../../README.md)