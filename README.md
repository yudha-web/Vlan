/interface vlan
add name=vlan10 vlan-id=10 
interface=ether2

/interface vlan
add name=vlan20 vlan-id=20 interface=ether2

/ip address
add address=192.168.10.1/24 interface=vlan10

/ip address
add address=192.168.20.1/24 interface=vlan20

/ip dhcp-server
add name=dhcp_vlan10 interface=vlan10 address-pool=dhcp_pool_vlan10 disabled=no

/ip dhcp-server
add name=dhcp_vlan20 interface=vlan20 address-pool=dhcp_pool_vlan20 disabled=no
