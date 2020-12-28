arr=($(ls /dev/pve | grep vm-21))
echo ${arr[@]}
for i in ${arr[@]}
do
	echo ${i:3:5}
	qm start ${i:3:5}
done
