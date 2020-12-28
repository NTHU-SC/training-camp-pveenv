arr=($(ls /dev/pve | grep vm-21))
echo ${arr[@]}
for i in ${arr[@]}
do
	echo ${i:3:5}
	qm destroy ${i:3:5} --purge 1
done
