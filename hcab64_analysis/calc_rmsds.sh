for i  in af2_*
do
	cd $i
	echo $i
	cp ../find_all_rmsds.py .
	x=`echo $i | cut -d _ -f 2-`
	for j in *.pdb
	do
		k=`echo $j | cut -d _ -f 1-6`
		python find_all_rmsds.py $j ../${x}/${k}.pdb ../${x}/${k}.txt >> rmsd.out
	done
	cd ..
done
