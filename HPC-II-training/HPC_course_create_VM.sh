for ID in $(seq -w 50 90)
do
    # Format ID with leading zero
    FORMATTED_ID=$(printf "%02d" $ID)

    VMID="1121$FORMATTED_ID"
    qm clone 9000 $VMID --name 112-1-student-$FORMATTED_ID
    qm set $VMID --name 112-1-student-$FORMATTED_ID
    qm set $VMID --net0 model=virtio,bridge=vmbr0

    # Set IP address with leading zero in the fourth octet
    qm set $VMID --ipconfig0 ip=10.121.187.1$FORMATTED_ID/24,gw=10.121.187.254

    qm set $VMID --onboot 1
    qm start $VMID
done
