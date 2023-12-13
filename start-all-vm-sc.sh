year=23
arr=($(ls /dev/pve-ssd | grep vm-${year}))
echo ${arr[@]}
for i in ${arr[@]}
do
	echo ${i:3:5}
	qm start ${i:3:5}
done
