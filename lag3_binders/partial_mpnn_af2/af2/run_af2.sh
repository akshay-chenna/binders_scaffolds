cd $PBS_O_WORKDIR
source ~/apps/scripts/source_conda.sh
conda activate dl_binder_design

for i in {41..80}
do
~/apps/dl_binder_design/af2_initial_guess/predict.py -silent pmpnn_passed_${i}_1.silent -outsilent paf2_passed_${i}_1.silent -scorefilename pout_${i}_1.sc -checkpoint_name pcheckaf2_${i}_1.point &
done
wait
