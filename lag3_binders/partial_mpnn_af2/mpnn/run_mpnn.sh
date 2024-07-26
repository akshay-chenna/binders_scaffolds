cd $PBS_O_WORKDIR
source ~/apps/scripts/source_conda.sh
conda activate py310

for i in {40..61}
do
~/apps/dl_binder_design/mpnn_fr/dl_interface_design.py -silent passed.silent -outsilent pmpnn_passed_${i}.silent -temperature 0.0001 -checkpoint_name pmpnn_passed_${i}.point &
done
wait
