# Extract
for i in {1..6}
do

a=`sed -n ${i}p passed_files.txt`
b=`sed -n ${i}p passed_pdbs.txt`
c=`sed -n ${i}p passed_pdbs.txt | cut -d _ -f -6`

silentextractspecific af2_${a}.silent $b
mv ${b}.pdb ${i}_af2.pdb

silentextractspecific mpnn_${a}.silent $c
mv ${c}.pdb ${i}_mpnn.pdb

done
