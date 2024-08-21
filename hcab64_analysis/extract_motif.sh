for i in *.pdb 
do
	a=`echo ${i} | cut -d . -f 1`
	grep PDBinfo-LABEL ${a}.pdb | awk '{print $3}' | sed 's/^/resid /g' | awk '{printf "%s or ", $0}' | sed 's/ or $/\n/'  > ${a}.txt ;

done
