source ~/scripts/source_conda.sh
conda activate af2_binder_design

for i in {1..13}
do
        for j in {1..20}
        do
                CUDA_VISIBLE_DEVICES=0 ~/apps/dl_binder_design/af2_initial_guess/predict_mod.py -silent best/best_${i}.pdb.silent -outsilent best_${i}_${j}.pdb.silent -scorefilename best_${i}_${j}.pdb.sc -checkpoint_name best_${i}_${j}.pdb.point -recycle 20
        done
done &

for i in {14..25}
do
        for j in {1..20}
        do
                CUDA_VISIBLE_DEVICES=1 ~/apps/dl_binder_design/af2_initial_guess/predict_mod.py -silent best/best_${i}.pdb.silent -outsilent best_${i}_${j}.pdb.silent -scorefilename best_${i}_${j}.pdb.sc -checkpoint_name best_${i}_${j}.pdb.point -recycle 20
        done
done
