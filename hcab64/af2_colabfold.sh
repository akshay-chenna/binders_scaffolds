CUDA_VISIBLE_DEVICES=0 colabfold_batch best_25-1.fasta results --num-recycle 20 --num-seeds 20 --max-msa 8:16 &

CUDA_VISIBLE_DEVICES=1 colabfold_batch best_25-2.fasta results --num-recycle 20 --num-seeds 20 --max-msa 8:16
wait
