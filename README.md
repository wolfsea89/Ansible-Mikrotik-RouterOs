Mikrotik-RouterOs-Ansible
=========

Playbooki:
- playbooks/create_backup.yml - Wykonanie kopii zapasowej
- playbooks/configure_router.yml - Konfiguracja routera

Skrypt wykonuje konfiguracje w następujnącej kolejności

Konfiguracja interface - role: Mikrotik-Interface
[1. Konfiguracja Wifi](docs/interfaces/wireless.md)
[2. Konfiguracja Ethernet](docs/interfaces/ethernet.md)
[3. Listy Intefejsów](docs/interfaces/bridge.md)
[4. Konfiguracja Bridge](docs/interfaces/bridge.md)
[2. Konfiguracja VLAN](docs/interfaces/vlan.md)


Tips
=========
Generowanie hasła, które jest osadzone source/tftpboot/menus/install_systems.cfg w lini 4 w miejscu << password >>
```
openssl passwd -1 password
```

Author Information
=========
 **Maciej Rachuna**
##### System Administrator & DevOps Engineer
rachuna.maciej@gmail.com