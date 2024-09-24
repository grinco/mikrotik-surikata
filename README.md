## Mikrotik Setup

1. Enable sniffer:
    ```sh
    /tool/sniffer/set filter-stream=yes streaming-enabled=yes streaming-server=[YOURDEBIANIP]:37008
    /tool/sniffer/start
    ```
2. Add firewall rules:
    ```sh
    /ip/firewall/raw/add action=drop chain=prerouting comment="IPS-drop_in_bad_traffic" src-address-list=ids_blocked
    /ip/firewall/raw/add action=drop chain=prerouting comment="IPS-drop_out_bad_traffic" dst-address-list=ids_blocked
    /ipv6/firewall/raw/add action=drop chain=prerouting comment="IPS-drop_in_bad_traffic" src-address-list=ids_blocked
    /ipv6/firewall/raw/add action=drop chain=prerouting comment="IPS-drop_out_bad_traffic" dst-address-list=ids_blocked
    ```
3. Enable Mikrotik API:
    ```sh
    /ip/service/set api-ssl address=[DEBIANIP] enabled=yes
    ```
4. Add Mikrocata user in Mikrotik:
    ```sh
    /user/add name=randomuser password=randompassword group=write

## Run Trafr with Suricata
See here: https://github.com/grinco/trafr-suricata

## Run mikrocata
```sh
docker run -d --volumes-from trafr -e ROUTER_IP='192.168.2.1' -e USERNAME='randomuser' -e PASSWORD='randompassword' grinco/mikrotik-surikata
```
Don't forget to change the IP address, and replace "randomuser" and "randompassword" with actual values.

## Credits
[zzbe/mikrocata](https://github.com/zzbe/mikrocata)

[angolo40/mikrocata2selks](https://github.com/angolo40/mikrocata2selks)
