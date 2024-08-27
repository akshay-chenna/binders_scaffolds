source ~/scripts/source_conda.sh
conda activate SE3nv

export CUDA_VISIBLE_DEVICES=0

# Running the RFdiffusion
python /home/paperspace/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=C1/8w0w_C1 inference.input_pdb=8w0w_clean.pdb \
'contigmap.contigs=[5-50/C427-449/5-50/C528-531/5-50/0 H1-124/0 L1-106/0]' \
contigmap.length=50-200 \
inference.num_designs=500 \
denoiser.noise_scale_ca=0.5 \
denoiser.noise_scale_frame=0.5 \
inference.ckpt_override_path=/home/paperspace/apps/RFdiffusion/models/Complex_base_ckpt.pt
