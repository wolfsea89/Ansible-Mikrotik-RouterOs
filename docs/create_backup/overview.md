Tworzenie kopii zapsowej
=========

Czynności jakie wykonuje rola:

1. Instalowanie pakietów
  a) sshpsss
2. Tworzenie katalogów do pobranie artefaktu
  - "/volumes/mikrotik/backup"
  - "/volumes/mikrotik/rsc"
3. Uruchomienie backupu na routerze Mikrotik
      ```
        /system backup save name="10.0.0.1.20210322.backup"
        /export file="	10.0.0.1.20210322.rsc"
      ```
4. Pobranie plików z routera Mikrotik
      ```
      sshpass -p "<< password >>" sftp user_tech@10.0.0.1:10.0.0.1.20210322.backup /volumes/mikrotik/backup
      sshpass -p "<< password >>" sftp user_tech@10.0.0.1:10.0.0.1.20210322.rsc /volumes/mikrotik/rsc
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
- name: Create backup
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-CreateBackup
      vars:
        input_role_destination_path: /volumes/mikrotik
        input_role_ansible_host:     "10.0.0.1"
        input_role_ansible_user:     "user_tech"
        input_role_ansible_password: "<< password >>"
```


[Powrót](../../README.md)