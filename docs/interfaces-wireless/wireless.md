Konfiguracja interfejsów WiFi
=========


Czynności jakie wykonuje rola:

1. konfiguracja interface
  Przykładowa komenda:
    ```
      /interface wireless set [ find default-name=wlan1 ] \
        band=2ghz-b/g/n                                   \
        channel-width=20/40mhz-XX                         \
        comment="SSID: Users Wifi Network""               \
        country=poland disabled=no                        \
        distance=indoors                                  \
        frequency=auto                                    \
        installation=indoor                               \
        mode=ap-bridge                                    \
        name=WiFi-LAN-01                                  \
        security-profile="Users Wifi Network"             \
        ssid="Users Wifi Network"                         \
        station-roaming=enabled                           \
        wireless-protocol=802.11
      /ip address add address=10.0.0.4/24 interface=WiFi-LAN-01 network=10.0.0.0
    ```
2. Konfiguracja Seecurity profiles
  Przykładowa komenda:
    ```
      /interface wireless security-profiles add  \
        authentication-types=wpa-psk,wpa2-psk    \
        mode=dynamic-keys                        \
        name="Users Wifi Network"                \
        wpa-pre-shared-key=PaSSw0rd!             \
        wpa2-pre-shared-key=PaSSw0rd!
    ```
3. Ustawia adress IP dla interface
    ```
      /ip address add address=10.0.0.4/24 interface=WiFi-LAN-01 network=10.0.0.0
    ```
4. Ustawia graphing dla interface
    ```
      /tool graphing interface add
          interface=WiFi-LAN-01
          store-on-disk=no
          allow-address=10.0.0.0/8
    ```

Użycie roli
=========

```
- name: Mikrotik Wireless Interface
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-Interface-Wireless
      vars:
        input_role_wireless_interfaces:
          wlan1:
            name: WiFi-LAN-01
            comment: "SSID: Users Network"
            ssid: "Users Network"
            security-profile: "Users Network"
            band: "2ghz-b/g/n"
            channel-width: "20/40mhz-XX"
            address: "10.0.0.4/24"
            network: "10.0.0.0"
            graphing:
              allow-address: 10.0.0.0/8
              store-on-disk: "no"
          wlan2:
            name: WiFi-LAN-02
            ssid: "Users Network"
            band: "5ghz-a/n/ac"
            channel-width: "20/40/80mhz-XXXX"
            security-profile: "Users Network"
            address: "10.0.0.5/24"
            network: "10.0.0.0"
            graphing:
              allow-address: 10.0.0.0/8
              store-on-disk: "no"
        input_role_wireless_security_profiles:
          default:
            name: default
            password: "password"
          UsersWifiNetwork:
            name: "Users Wifi Network"
            password: "PaSSw0rd!"
        input_role_debug:                      false
      when:
        - inventory_host_routeros_wireless_interfaces is defined
```

Przykład inventory:
```
inventory_host_routeros_wireless_interfaces:
  wlan1:                                      # Default Interface Name
    name: WiFi-LAN-01                         # New Interface Name
    comment: "SSID: Users Wifi Network"       # Comment
    ssid: "Users Wifi Network"                # SSID
    security_profile: "Users Wifi Network"    # Security Profile
    band: "2ghz-b/g/n"                        # Band
    channel-width: "20/40mhz-XX"              # Channeel
    address: "10.0.0.4/24"                    # Interface Address
    network: "10.0.0.0"                       # Network
    graphing:                                 # Enable graphing (optional)
      allow-address: 0.0.0.0/0                # Allow address do graphing
      store-on-disk: "no"                     # Store data on disk
    other_params: ""                          # Other parameters (optional)
  wlan2:
    name: WiFi-LAN-02
    ssid: "SSID: Users Wifi Network"
    security_profile: "Users Wifi Network"
    band: "5ghz-a/n/ac"
    channel-width: "20/40/80mhz-XXXX"
    address: "10.0.0.5/24"
    network: "10.0.0.0"
    graphing:
      allow-address: 0.0.0.0/0
      store-on-disk: "no"

inventory_group_routeros_wireless_security_profiles:
  default:
    name: default
    password: "password"
    other_params: "" # optional
  UsersWifiNetwork:
    name: "Users Wifi Network"
    password: "PaSSw0rd!"
```
[Powrót](../../README.md)