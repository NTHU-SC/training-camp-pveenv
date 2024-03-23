for ID in $(seq -w 80 90)
do
    # Format ID with leading zero
    FORMATTED_ID=$(printf "%02d" $ID)

    VMID="1121$FORMATTED_ID"
    qm stop $VMID --timeout 60
    qm destroy $VMID --purge 1
    
done
