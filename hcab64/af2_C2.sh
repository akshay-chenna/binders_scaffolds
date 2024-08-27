source ~/scripts/source_conda.sh
conda activate af2_binder_design

export CUDA_VISIBLE_DEVICES=1

for i in {1..8}
do
	~/apps/dl_binder_design/af2_initial_guess/predict.py -silent mpnn_8w0w_C2_${i}.silent -outsilent af2_8w0w_C2_${i}.silent -scorefilename af2_8w0w_C2_${i}.sc -checkpoint_name af2_8w0w_C2_${i}.point
done
