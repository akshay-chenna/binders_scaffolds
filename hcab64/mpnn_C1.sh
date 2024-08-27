source ~/scripts/source_conda.sh
conda activate proteinmpnn_binder_design

export CUDA_VISIBLE_DEVICES=0

mpnn(){
	a=$1
	~/apps/dl_binder_design/mpnn_fr/dl_interface_design.py -silent rfd_8w0w_C1.silent -outsilent mpnn_8w0w_C1_${a}.silent -temperature 0.1 -checkpoint_name mpnn_8w0w_C1_${a}.point
	sleep 2
}

for i in {1..8}
do
	mpnn $i &
done
wait

