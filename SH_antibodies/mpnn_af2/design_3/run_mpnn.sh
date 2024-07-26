cd $PBS_O_WORKDIR
source ~/apps/scripts/source_conda.sh
conda activate py310

for i in {1..20}
do
~/apps/dl_binder_design/mpnn_fr/dl_interface_design.py -silent design_3.silent -outsilent mpnn_3_${i}.silent -temperature 0.0001 -checkpoint_name mpnn_3_${i}.point &
done
wait
