cd $PBS_O_WORKDIR
source ~/apps/scripts/source_conda.sh
conda activate SE3nv

/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py inference.output_prefix=binders_outputs/design_3 inference.input_pdb=7raq_fv_sh_0002.pdb 'contigmap.contigs=[H1-124/0 L1-107/0 25-70/P1-15]' inference.num_designs=100 inference.ckpt_override_path=/home/chemical/phd/chz198152/apps/RFdiffusion/models/ActiveSite_ckpt.pt 

#'potentials.guiding_potentials=["type:monomer_ROG,weight:1,min_dist:5"]' potentials.guide_scale=2 potentials.guide_decay="quadratic"

