/interface vlan
add name=VLAN10 vlan-id=10 
interface=ether2

/interface vlan
add name=VLAN20 vlan-id=20 interface=ether2

/ip address
add address=192.168.10.1/24 interface=VLAN10

/ip address
add address=192.168.20.1/24 interface=VLAN20

/ip dhcp-server
add name=dhcp_VLAN10 interface=VLAN10 
address-pool=dhcp_pool_vlan10 disabled=no

/ip dhcp-server
add name=dhcp_VLAN20 interface=VLAN20 address-pool=dhcp_pool_vlan20 disabled=no

/ip hotspot setup
set interface=wlan1 address=192.168.50.1/24 dns-name=faisal.net dns-server=8.8.8.8,8.8.4.4 name=hotspot1

/interface wireless
set wlan1 mode=ap-bridge ssid=makan disabled=no

/ip hotspot
setup interface=wlan1

/ip hotspot profile
set [find] login-by=http-chap,http-pap

/ip hotspot user profile
add name=kepalasekolah rate-limit=512k/512k

/ip hotspot user profile
add name=guru rate-limit=256k/256k

/ip hotspot user profile
add name=siswa rate-limit=128k/128k

/ip hotspot user
add name=kepalasekolah password=12345
profile=kepalasekolah

/ip hotspot user
add name=guru password=12345 profile=guru

/ip hotspot user
add name=siswa password=12345 profile=siswa

/system clock
set time-zone-name=Asia/Jakarta
