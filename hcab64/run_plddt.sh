for i  in af2_*
do
	cd $i
	echo $i
	ln -s ../calc_plddt.sh .
	x=`echo $i | cut -d _ -f 2-`
	for j in *.pdb
	do
		k=`echo $j | cut -d _ -f 1-6`
		bash calc_plddt.sh  $j ../mpnn_${x}/${k}_motif.txt >> plddts.out
	done
	cd ..
done
