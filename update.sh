year="23"
for i in $(seq $2 $3)
do
	vmi=$(printf "%02d" $i);
	qm set ${year}${vmi}0   --cores=12 \
                                --memory=16384 --balloon=3072	

	qm set ${year}${vmi}1   --cores=12 \
                                --memory=16384 --balloon=3072	
	
	#qm set ${year}${vmi}0   --autostart 0 \
	#			--memory=6144 --balloon=3072 \
	#			--cpu host
	#qm set ${year}${vmi}1   --autostart 0 \
	#			--memory=6144 --balloon=3072 \
	#			--cpu host
done
