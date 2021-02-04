apt-get install usbip
modprobe usbip_core
modprobe usbip_host
modprobe vhci-hcd
usbip attach -r $2 -b $3
qm set $1 --usb0 host=`usbip port | grep -e "10.121.180.251.*1-1.3" | cut -c 8-10 | head -n 1`
