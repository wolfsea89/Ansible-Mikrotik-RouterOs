Konfiguracja interfejsów Bridge
=========



Czynności jakie wykonuje rola:

1. Tworzenie listy interfejsów
  Przykładowa komenda:
    ```
      /interface list add name=LIST-WAN comment=""
    ```
2. Dodanie interfejsów dla listy intergesów
  Przykładowa komenda:
    ```
      /interface list member add comment="WAN" interface=WAN-01 list=LIST-WAN disabled=no
    ```

Użycie roli
=========

```
- name: Mikrotik List Interface
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-Interface-List
      vars:
        input_role_lists_interfaces:
          list_wan:
            name: LIST-WAN
            interfaces:
              - name: "WAN-01"
                comment: "WAN"
          list_lan_users:
            name: LIST-LAN-USERS
            interfaces:
              - name: "LAN-WiFi-01"
              - name: "LAN-WiFi-02"
                comment: "LAN-USERS"
          list_lan_admins:
            name: LIST-LAN-ADMINS
            interfaces:
              - name: "LAN-04"
                comment: "LAN-ADMINS"
          list_lan_proxmox:
            name: LIST-LAN-PROXMOX
            interfaces:
              - name: "LAN-01"
              - name: "LAN-02"
              - name: "LAN-03"
                comment: "LAN-PROXMOX"
        input_role_debug: true
```


Przykład inventory:
```
inventory_host_routeros_lists_interfaces:
  list_wan:
    name: LIST-WAN
    interfaces:
      - name: "WAN-01"
        comment: "WAN"
  list_lan_users:
    name: LIST-LAN-USERS
    interfaces:
      - name: "LAN-WiFi-01"
      - name: "LAN-WiFi-02"
        comment: "LAN-USERS"
  list_lan_admins:
    name: LIST-LAN-ADMINS
    interfaces:
      - name: "LAN-04"
        comment: "LAN-ADMINS"
  list_lan_proxmox:
    name: LIST-LAN-PROXMOX
    interfaces:
      - name: "LAN-01"
      - name: "LAN-02"
      - name: "LAN-03"
        comment: "LAN-PROXMOX"
```


[Powrót](../../README.md)