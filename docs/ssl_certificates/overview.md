Konfiguracja certyfikatów SSL
=========

Czynności jakie wykonuje rola:

1. Tworzenie tymczasowego katalogu
  ```
  mkdir -p /tmp/cert
  ```
2. Generowanie certyfikatu `ssl.crt` z zmiennej invnetory
3. Generowanie klucza prywatnego `ssl.key` z zmiennej invnetory
4. Wysyłanie certyfikatów do mikrotik
  Przykładowa komenda:
  ```
    sshpass -p "<< password >>" scp "/tmp/crt/ssl.key" ansible@10.0.0.1:ssl.crt
  ```
  Przykładowa komenda:
  ```
    /certificate import file-name=ssl.crt name="router.rachuna.net" passphrase=""
    /certificate import file-name=ssl.key name="router.rachuna.net" passphrase=""
  ```


Użycie roli
=========

```
- name: Copy SSL Certificate
  hosts: routeros
  tasks:
    - include_role:
        name: Mikrotik-SSL-Certificates
      vars:
        input_role_server_certificates:
          name: "router.rachuna.net"
          key: "***"
          crt: "***"
          passphrase: ""
        input_role_ansible_host:     "10.0.0.1"
        input_role_ansible_user:     "user_tech"
        input_role_ansible_password: "<< password >>"
```


[Powrót](../../README.md)