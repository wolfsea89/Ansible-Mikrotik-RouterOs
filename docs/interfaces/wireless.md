Konfiguracja interfejsów WiFi
=========

Przykład inventory:
```
inventory_group_routeros_wireless_interfaces:
  wlan1:                                      # Default Interface Name
    name: WiFi-LAN-01                         # New Interface Name
    comment: "SSID: Users Wifi Network"       # Comment
    ssid: "Users Wifi Network"                # SSID
    security_profile: "Users Wifi Network"    # Security Profile
    band: "2ghz-b/g/n"                        # Band
    channel_width: "20/40mhz-XX"              # Channeel
    address: "10.0.0.4/24"                    # Interface Address
    network: "10.0.0.0"                       # Network
    graphing:                                 # Enable graphing (optional)
      allow_address: 0.0.0.0/0                # Allow address do graphing
      store_on_disk: "no"                     # Store data on disk
    other_params: ""                          # Other parameters (optional)
  wlan2:
    name: WiFi-LAN-02
    ssid: "SSID: Users Wifi Network"
    security_profile: "Users Wifi Network"
    band: "5ghz-a/n/ac"
    channel_width: "20/40/80mhz-XXXX"
    address: "10.0.0.5/24"
    network: "10.0.0.0"
    graphing:
      allow_address: 0.0.0.0/0
      store_on_disk: "no"
```

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
```

Security Profiles
=========

Przykład inventory:
```
inventory_group_routeros_wireless_security_profiles:
  default:
    name: default
    password: "password"
    other_params: "" # optional
  UsersWifiNetwork:
    name: "Users Wifi Network"
    password: "PaSSw0rd!"
```

Przykładowa komenda:
```
/interface wireless security-profiles add  \
  authentication-types=wpa-psk,wpa2-psk    \
  mode=dynamic-keys                        \
  name="Users Wifi Network"                \
  wpa-pre-shared-key=PaSSw0rd!             \
  wpa2-pre-shared-key=PaSSw0rd!
``