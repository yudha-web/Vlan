
/system clock set time-zone-name=Asia/Jakarta

/system identity
set name=UKK-YUDHA

/user
add name=UKK-YUDHA group=full

/interface vlan
add name=VLAN10 vlan-id=10 interface=ether2
add name=VLAN20 vlan-id=20 interface=ether2

/ip address
add address=192.168.10.1/24 interface=VLAN10
add address=192.168.20.1/24 interface=VLAN20
add address=192.168.40.1/24 interface=wlan1

/interface wireless
set wlan1 mode=ap-bridge ssid=makan country=indonesia frequency-mode=regulatory-domain band=2ghz-bgn disabled=no

/ip pool
add name=dhcp_pool_vlan10 ranges=192.168.10.2-192.168.10.50
add name=dhcp_pool_vlan20 ranges=192.168.20.2-192.168.20.50
add name=hotspot_pool ranges=192.168.40.2-192.168.40.254

/ip dhcp-server
add name=dhcp_VLAN10 interface=VLAN10 address-pool=dhcp_pool_vlan10 disabled=no
add name=dhcp_VLAN20 interface=VLAN20 address-pool=dhcp_pool_vlan20 disabled=no

/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1 dns-server=8.8.8.8
add address=192.168.20.0/24 gateway=192.168.20.1 dns-server=8.8.8.8

/ip hotspot
add name=hotspot1 interface=wlan1 address-pool=hotspot_pool profile=default

/ip hotspot profile
set [find default=yes] dns-name=faisal.net login-by=http-chap,http-pap

/ip hotspot user profile
add name=kepalasekolah rate-limit=512k/512k
add name=guru rate-limit=256k/256k
add name=siswa rate-limit=128k/128k

/ip hotspot user
add name=kepalasekolah password=123 profile=kepalasekolah
add name=guru password=456 profile=guru
add name=siswa password=789 profile=siswa
