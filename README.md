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
- [Konfiguracja interfejsów wireless (role: Mikrotik-Interface-Wireless)](docs/interfaces-wireless/wireless.md)
- [Konfiguracja ethernet interfaces (role: Mikrotik-Interface-Ethernet)](docs/interfaces-ethernet/ethernet.md)
- [Konfiguracja listy interfaces (role: Mikrotik-Interface-List)](docs\interfaces-list\interface_list.md)
- [Konfiguracja briges interfaces (role: Mikrotik-Interface-Bridge)](docs/interfaces-bridge/bridge.md)
- [Konfiguracja vlan interfaces (role: Mikrotik-Interface-VLan)](docs/interfaces-bridge/vlan.md)
- [Konfiguracja klienta dhcp (role: Mikrotik-DHCP-Client)](docs/dhcp_client/overview.md)
- [Konfiguracja serwera dhcp (role: Mikrotik-DHCP-Server)](docs/dhcp_server/overview.md)
- [Konfiguracja serwera dns (role: Mikrotik-DNS-Server)](docs/dns_server/overview.md)
- [Konfiguracja usługi ntp (role: Mikrotik-NTP-Client)](docs/ntp_client/overview.md)
- [Konfiguracja certyfikatów SSL (role: Mikrotik-SSL-Certificates)](docs/ssl_certificates/overview.md)
- [Konfiguracja monitoringu portów (role: Mikrotik-Graphing)](docs/graphing/overview.md)
- [Konfiguracja firewall (role: Mikrotik-Firewall)](docs/firewall/overview.md)
- [Konfiguracja grup i użytkowników (role: Mikrotik-UsersManagment)](docs/user_managment/users_managment.md)

Author Information
=========
 **Maciej Rachuna**
##### System Administrator & DevOps Engineer
rachuna.maciej@gmail.com