for i in $(seq $1 $2)
do
	useri=$(printf "%02d" $i);
	echo $useri
	pveum userdel scteam${useri}@pve
done
