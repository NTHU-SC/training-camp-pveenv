year="21"
for i in $(seq $1 $2)
do
	useri=$(printf "%02d" $i);
	echo $useri
	pveum user add scteam${useri}@pve \
	       	--password nthusc 
	pveum aclmod /vms/${year}${useri}0 \
		-user scteam${useri}@pve \
		-role PVEVMUser
	pveum aclmod /vms/${year}${useri}1 \
		-user scteam${useri}@pve \
		-role PVEVMUser

done
