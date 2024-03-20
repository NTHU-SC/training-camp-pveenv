year=23
arr=($(ls /dev/pve-ssd | grep vm-${year}))
echo ${arr[@]}
for i in ${arr[@]}
do
	echo ${i:3:5}
	qm stop ${i:3:5} --timeout 60
	qm destroy ${i:3:5} --purge 1
done
