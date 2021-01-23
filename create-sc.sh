year="21"
for i in $(seq $2 $3)
do
	vmi=$(printf "%02d" $i);	
	qm clone ${1}1 21${vmi}0 --name scteam${vmi}-head && \
	qm set ${year}${vmi}0   --autostart 1 \
				--net1 model=virtio,tag=21${vmi},bridge=vmbr1
	qm clone ${1}2 21${vmi}1 --name scteam${vmi}-work && \
	qm set ${year}${vmi}1   --autostart 1 \
				--net0 model=virtio,tag=21${vmi},bridge=vmbr1
done
