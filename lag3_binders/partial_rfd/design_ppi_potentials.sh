cd $PBS_O_WORKDIR
source ~/apps/scripts/source_conda.sh
conda activate SE3nv


/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_10 \
inference.input_pdb=complex_short.pdb 'contigmap.contigs=[15-15/0 B1-145]' 'ppi.hotspot_res=[B36,B84,B126,B130]' \
diffuser.partial_T=30 \
inference.num_designs=10000 \
denoiser.noise_scale_ca=0.25 \
denoiser.noise_scale_frame=0.25 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'


