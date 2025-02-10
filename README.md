/system clock set time-zone-name=Asia/Jakarta

/interface vlan
add name=VLAN10 vlan-id=10 interface=ether2

/interface vlan
add name=VLAN20 vlan-id=20 interface=ether2

/ip address
add address=192.168.10.1/24 interface=VLAN10

/ip address
add address=192.168.20.1/24 interface=VLAN20

/ip address
add address=192.168.50.1/24 interface=wlan1

/interface wireless
set wlan1 mode=ap-bridge ssid=makan disabled=no

/ip pool
add name=dhcp_pool_vlan10 ranges=192.168.10.100-192.168.10.254

/ip pool
add name=dhcp_pool_vlan20 ranges=192.168.20.100-192.168.20.254

/ip dhcp-server
add name=dhcp_VLAN10 interface=VLAN10 address-pool=dhcp_pool_vlan10 disabled=no

/ip dhcp-server
add name=dhcp_VLAN20 interface=VLAN20 address-pool=dhcp_pool_vlan20 disabled=no

/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1 dns-server=8.8.8.8

/ip dhcp-server network
add address=192.168.20.0/24 gateway=192.168.20.1 dns-server=8.8.8.8

/ip pool
add name=hotspot_pool ranges=192.168.50.2-192.168.50.254

/ip dhcp-server
add name=hotspot_dhcp interface=wlan1 address-pool=hotspot_pool disabled=no

/ip dhcp-server network
add address=192.168.40.0/24 gateway=192.168.40.1 dns-server=8.8.8.8,8.8.4.4

/ip hotspot
add name=hotspot1 interface=wlan1 address-pool=hotspot_pool profile=default

/ip hotspot profile
set [find default=yes] dns-name=faisal.net login-by=http-chap,http-pap

/ip hotspot user profile
add name=kepalasekolah rate-limit=512k/512k

/ip hotspot user profile
add name=guru rate-limit=256k/256k

/ip hotspot user profile
add name=siswa rate-limit=128k/128k

/ip hotspot user
add name=kepalasekolah password=123 profile=kepalasekolah

/ip hotspot user
add name=guru password=456 profile=guru

/ip hotspot user
add name=siswa password=789 profile=siswa