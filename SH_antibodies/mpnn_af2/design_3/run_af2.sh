cd $PBS_O_WORKDIR
source ~/apps/scripts/source_conda.sh
conda activate dl_binder_design

for i in {1..20}
do
~/apps/dl_binder_design/af2_initial_guess/predict.py -silent mpnn_3_${i}.silent -outsilent af2_3_${i}.silent -scorefilename out_3_${i}.sc -checkpoint_name checkaf2_3_${i}.point &
done
wait
