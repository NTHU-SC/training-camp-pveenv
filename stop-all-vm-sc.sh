year=23
arr=($(ls /dev/pve | grep vm-${year}))
echo ${arr[@]}
for i in ${arr[@]}
do
	echo ${i:3:5}
	qm stop ${i:3:5}
done
