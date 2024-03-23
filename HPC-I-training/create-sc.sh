year="24"
for i in $(seq $2 $3)
do
	vmi=$(printf "%02d" $i);	
	qm clone ${1}1 ${year}${vmi}0 --name scteam${vmi}-head && \
	qm set ${year}${vmi}0   --autostart 1 \
				--net1 model=virtio,tag=21${vmi},bridge=vmbr1
	qm clone ${1}2 ${year}${vmi}1 --name scteam${vmi}-work1 && \
	qm set ${year}${vmi}1   --autostart 1 \
				--net0 model=virtio,tag=21${vmi},bridge=vmbr1
    qm clone ${1}2 ${year}${vmi}2 --name scteam${vmi}-work2 && \
	qm set ${year}${vmi}2   --autostart 1 \
				--net0 model=virtio,tag=21${vmi},bridge=vmbr1
    qm clone ${1}2 ${year}${vmi}3 --name scteam${vmi}-work3 && \
	qm set ${year}${vmi}3   --autostart 1 \
				--net0 model=virtio,tag=21${vmi},bridge=vmbr1
    qm clone ${1}2 ${year}${vmi}4 --name scteam${vmi}-work4 && \
	qm set ${year}${vmi}4   --autostart 1 \
				--net0 model=virtio,tag=21${vmi},bridge=vmbr1            
done