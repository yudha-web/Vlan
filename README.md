/interface vlan
add name=vlan10 vlan-id=10 
interface=ether1

/interface vlan
add name=vlan20 vlan-id=20 interface=ether1

/ip address
add address=192.168.10.1/24 interface=vlan10

/ip address
add address=192.168.20.1/24 interface=vlan20

/ip dhcp-server
add name=dhcp_vlan10 interface=vlan10 address-pool=dhcp_pool_vlan10 disabled=no

/ip dhcp-server
add name=dhcp_vlan20 interface=vlan20 address-pool=dhcp_pool_vlan20 disabled=no

/ip pool
add name=dhcp_pool_vlan10 ranges=192.168.10.10-192.168.10.50

/ip pool
add name=dhcp_pool_vlan20 ranges=192.168.20.10-192.168.20.50

/interface ethernet switch vlan
add vlan-id=10 ports=ether1,ether2

/interface ethernet switch vlan
add vlan-id=20 ports=ether3,ether4
