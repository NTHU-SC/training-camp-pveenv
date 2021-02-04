year="21"
for i in $(seq $2 $3)
do
	vmi=$(printf "%02d" $i);	
	qm set ${year}${vmi}0   --autostart 1 \
				--sockets=2 --numa=1   --cores=12 \
				--memory=32768 --balloon=3072
	qm set ${year}${vmi}1   --autostart 1 \
				--socket=2  --numa=1   --cores=12 \
				--memory=32768 --balloon=3072
done
