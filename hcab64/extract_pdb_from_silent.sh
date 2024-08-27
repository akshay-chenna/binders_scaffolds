for i in *.silent
do
	j=`echo $i | cut -d . -f 1`
	mkdir $j
	silentextract $i
	mv *.pdb $j/
	echo "$i done"
done
