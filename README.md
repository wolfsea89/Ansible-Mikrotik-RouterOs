Mikrotik-RouterOs-Ansible
=========

Playbooki:
- playbooks/create_backup.yml - Wykonanie kopii zapasowej
- playbooks/configure_router.yml - Konfiguracja routera

Konfiguracja połączenia SSH - Anisble
- [Komunikacja](docs/ansible_connections/overview.md)

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
- [Konfiguracja usługi ntp (role: Mikrotik-NTP-Client)](docs/ntp_client/overview.md)
- [Konfiguracja certyfikatów SSL (role: Mikrotik-SSL-Certificates)](docs/ssl_certificates/overview.md)
- [Konfiguracja monitoringu portów (role: Mikrotik-Graphing)](docs/graphing/overview.md)
- [Konfiguracja firewall](docs/firewall/overview.md)


TO DO
=========
```
/interface wireless manual-tx-power-table
set WiFi-LAN-01 comment="SSID: Users Wifi Network"
/interface wireless nstreme
set WiFi-LAN-01 comment="SSID: Users Wifi Network"
```

Author Information
=========
 **Maciej Rachuna**
##### System Administrator & DevOps Engineer
rachuna.maciej@gmail.com