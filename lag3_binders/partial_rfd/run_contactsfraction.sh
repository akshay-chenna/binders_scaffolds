cd $PBS_O_WORKDIR
source ~/apps/scripts/source_conda.sh
conda activate py310

for i in {1..20}
	do
	{
	for ((j = $((0+i*500-500)); j <= $((0+i*500-1)) ; j++)); do
        	python find_rescontacts.py binders_outputs/design_10_${j}.pdb contact_fractions/design_10_${j}.resfrac.txt
    	done 
	} &
done
wait
