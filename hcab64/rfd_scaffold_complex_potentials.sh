source ~/scripts/source_conda.sh
conda activate SE3nv

export CUDA_VISIBLE_DEVICES=1

# Running the RFdiffusion
python /home/paperspace/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=C2/8w0w_C2 inference.input_pdb=8w0w_clean.pdb \
'contigmap.contigs=[5-50/C427-449/5-50/C528-531/5-50/0 H1-124/0 L1-106/0]' \
contigmap.length=50-200 \
inference.num_designs=500 \
denoiser.noise_scale_ca=0.5 \
denoiser.noise_scale_frame=0.5 \
inference.ckpt_override_path=/home/paperspace/apps/RFdiffusion/models/Complex_base_ckpt.pt \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=3 potentials.guide_decay='quadratic'
