for i in {41..80}
do
silentsplitnoshuf pmpnn_passed_${i}.silent 300
j=1
	for k in x* 
	do 
		mv $k pmpnn_passed_${i}_${j}.silent 
		j=$((j+1)) 
	done
done
