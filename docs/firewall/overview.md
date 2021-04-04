Konfigurowanie firewall
=========

Czynności jakie wykonuje rola:

1. konfiguracja roli firewall
  Przykładowa komenda:
  ```
    /ip firewall filter add action=drop chain=input comment="DHCP from WAN" in-interface-list=LIST-WAN protocol=dccp
  ```
2. Konfiguracja roli nat firewall
  Przykładowa komenda:
  ```
    /ip firewall nat add action=masquerade chain=srcnat comment="Users Network" out-interface-list=LIST-WAN src-address=10.1.0.0/24
  ```

Użycie roli
=========

```
- name: Firewall
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-Firewall
      vars:
        input_role_firewall_rules:
          dhcp_from_wan:
            action: drop
            chain: input
            comment: "DHCP from WAN"
            disabled: "no"
            in_interface_list: LIST-WAN
            protocol: dccp
          ssh_from_wan:
            action: reject
            chain: input
            comment: "SSH from WAN"
            disabled: "no"
            in_interface_list: LIST-WAN
            protocol: tcp
            reject_with: icmp-network-unreachable
            dst_port: 22
        input_role_firewall_nat_rules:
          users_network:
            action: masquerade
            chain: srcnat
            comment: "Users Network"
            disabled: "no"
            out_interface_list: LIST-WAN
            src_address: 10.1.0.0/24
            log: "no"
            log_prefix: ""
          proxmox_network:
            action: masquerade
            chain: srcnat
            comment: "Proxmox Network"
            disabled: "no"
            out_interface_list: LIST-WAN
            src_address: 10.2.0.0/24
            log: "no"
            log_prefix: ""
```


[Powrót](../../README.md)