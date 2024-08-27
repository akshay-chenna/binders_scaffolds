source ~/scripts/source_conda.sh
conda activate SE3nv

export CUDA_VISIBLE_DEVICES=0

python /home/paperspace/apps/RFdiffusion/scripts/run_inference.py \
inference.input_pdb=8w0w_clean.pdb inference.output_prefix=./run_1 \
'contigmap.contigs=[50-250/0 H1-124/0 L1-106/0]' 'ppi.hotspot_res=[H1,H29,H54,H104,H107,L56]' \
inference.num_designs=10000 \
denoiser.noise_scale_ca=0.5 \
denoiser.noise_scale_frame=0.5 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=3 potentials.guide_decay='quadratic'
