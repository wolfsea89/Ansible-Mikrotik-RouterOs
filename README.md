Mikrotik-RouterOs-Ansible
=========

Playbooki:
- playbooks/create_backup.yml - Wykonanie kopii zapasowej
- playbooks/configure_router.yml - Konfiguracja routera

Skrypt wykonuje konfiguracje w następujnącej kolejności
- [Tworzenie kopii zapasowej (role: Mikrotik-CreateBackup)](docs/create_backup/overview.md)
- [Ustawienie nazwy routera (role: Mikrotik-SetIdentity)](docs/set_identity/overview.md)
- Konfiguracja interfaces (role: Mikrotik-Interface)
  - [1. Konfiguracja Wifi](docs/interfaces/wireless.md)
  - [2. Konfiguracja Ethernet](docs/interfaces/ethernet.md)
  - [3. Listy Intefejsów](docs/interfaces/bridge.md)
  - [4. Konfiguracja Bridge](docs/interfaces/bridge.md)
  - [5. Konfiguracja VLAN](docs/interfaces/vlan.md)
- [Konfiguracja serwera dhcp (role: Mikrotik-DHCP-Server)](docs/dhcp_server/overview.md)
- [Konfiguracja klienta dhcp (role: Mikrotik-DHCP-Client)](docs/dhcp_client/overview.md)
- [Konfiguracja serwera dns (role: Mikrotik-DNS-Server)](docs/dns_server/overview.md)

Mikrotik-NTP-Client
Mikrotik-SSL-Certificates


TO DO
=========
```
/interface wireless manual-tx-power-table
set WiFi-LAN-01 comment="SSID: Wybrzeze Klatki Schodowej"
/interface wireless nstreme
set WiFi-LAN-01 comment="SSID: Wybrzeze Klatki Schodowej"
```

Author Information
=========
 **Maciej Rachuna**
##### System Administrator & DevOps Engineer
rachuna.maciej@gmail.com