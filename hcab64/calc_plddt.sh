a=$1
b=$2

nres=`grep -B 1 TER ${a} | awk '{print $6}' | head -1`

grep -o '[0-9]\+' ${b} | while read -r l
do
	grep PDBinfo ${a} | sed -n "${l}p" | awk '{print $NF}' >> ${a}.temp 
done

nres_motif=`grep -o '[0-9]\+' ${b} | wc -l`
nres_scaffold=$((nres - nres_motif))

plddt_motif_sum=`awk '{sum +=$1} END {print sum}' ${a}.temp`
plddt_binder=`grep plddt_binder ${a} | awk '{print $NF}'`
plddt_motif=$(echo "scale=2; ($plddt_motif_sum) / $nres_motif" | bc)
plddt_scaffold=$(echo "scale=2; ($plddt_binder * $nres - $plddt_motif_sum) / $nres_scaffold" | bc)

echo -e "${b} \t ${plddt_binder} \t ${plddt_scaffold} \t ${plddt_motif}"
rm ${a}.temp
