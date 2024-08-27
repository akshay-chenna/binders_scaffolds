for i in {1..8}
do 
	cd mpnn_8w0w_C1_$i
	ln -s ../extract_motif.sh .
	bash extract_motif.sh
	echo "${i}" done
	cd ..
done

for i in {1..8}
do 
	cd mpnn_8w0w_C2_$i
	ln -s ../extract_motif.sh .
	bash extract_motif.sh
	echo "${i}" done
	cd ..
done
