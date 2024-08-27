rmsd () {
	i=$1
	cd $i
	echo $i
	ln -s ../calc_all_rmsds.py .
	x=`echo $i | cut -d _ -f 2-`
	for j in *.pdb
	do
		k=`echo $j | cut -d _ -f 1-6`
		echo -e "${x} \t ${k}" >> rmsd.out
		python calc_all_rmsds.py $j ../mpnn_${x}/${k}.pdb ../mpnn_${x}/${k}_motif.txt >> rmsd.out
	done
	cd ..

}

for t in {1..8}
do
	rmsd af2_8w0w_C1_${t} &
	rmsd af2_8w0w_C2_${t} &
done
wait
