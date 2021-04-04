Konfiguracja serwera dns
=========

Czynności jakie wykonuje rola:

1. konfiguracja serwera dns
  Przykładowa komenda:
  ```
    /ip dns static set allow-remote-requests=yes cache-max-ttl=1d servers=8.8.8.8,4.4.4.4 verify-doh-cert=yes
  ```
2. Konfiguracja rekordów dns
  Przykładowa komenda:
  ```
    /ip dns static add address=10.0.0.1 name=router.rachuna.net
  ```

Użycie roli
=========

```
- name: DNS Server
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-DNS-Server
      vars:
        input_role_dns_parameters:
          allow_remote_requests: "yes"
          verify_doh_cert: "yes"
          servers:
            - 8.8.8.8
            - 4.4.4.4
          cache_max_ttl: "1d"
        input_role_dns_static_records:
          - name: "router.rachuna.net"
            address: "10.0.0.1"
            comment: ""
            disabled: "no"
            regexp: ""
            ttl: 1d
            type: 'A'
```


[Powrót](../../README.md)