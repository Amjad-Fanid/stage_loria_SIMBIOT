sudo nmcli device disconnect wlan0

nmcli device set wlan0 managed no
ip link set wlan0 down
iw dev wlan0 set type ibss
sudo ip link set wlan0 mtu 1468 
ip link set wlan0 up
iw dev wlan0 ibss join mon-mesh-pi 2437 02:AA:BB:CC:DD:EE # les paramètres du réseau peuvent etre personnalisés

modprobe batman-adv
sleep 2     
sudo batctl routing_algo BATMAN_IV                 
batctl if add wlan0
ip link set up dev bat0
ip addr add 192.168.99."x"/24 dev bat0     # x : à définir sur chaque raspberry
ip addr add 192.168.50.2/24 dev eth0              
ip link set up dev eth0
