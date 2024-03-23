for ID in $(seq -w 50 90)
do
    # Format ID with leading zero
    FORMATTED_ID=$(printf "%02d" $ID)

    VMID="1121$FORMATTED_ID"
    qm stop $VMID
done
