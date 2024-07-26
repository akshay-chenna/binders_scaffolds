complex.pdb: 2_dock1_431w.pdb (see input_data)
complex_short.pdb: residues 1-15 of synu (smallest continuous chain in contact with the four hotspots of lag3 B36,B84,B126,B130)

design_1
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_1 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' 'ppi.hotspot_res=[B36,B84,B126]' \
diffuser.partial_T=40 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0.25 \
denoiser.noise_scale_frame=0.25 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_2
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_2 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' \
diffuser.partial_T=40 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0.25 \
denoiser.noise_scale_frame=0.25 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_3
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_3 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' \
diffuser.partial_T=40 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0 \
denoiser.noise_scale_frame=0 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_4
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_4 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' 'ppi.hotspot_res=[B36,B84,B126]' \
diffuser.partial_T=40 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0 \
denoiser.noise_scale_frame=0 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_5
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_5 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' 'ppi.hotspot_res=[B36,B84,B126]' \
diffuser.partial_T=20 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0 \
denoiser.noise_scale_frame=0 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_6
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_6 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' \
diffuser.partial_T=20 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0 \
denoiser.noise_scale_frame=0 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_7
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_7 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' \
diffuser.partial_T=20 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0.25 \
denoiser.noise_scale_frame=0.25 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_8
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_8 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' 'ppi.hotspot_res=[B36,B84,B126]' \
diffuser.partial_T=20 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0.25 \
denoiser.noise_scale_frame=0.25 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'

design_9
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_8 \
inference.input_pdb=complex.pdb 'contigmap.contigs=[23-23/0 B1-145]' 'ppi.hotspot_res=[B36,B84,B126]' \
diffuser.partial_T=30 \
inference.num_designs=100 \
denoiser.noise_scale_ca=0.25 \
denoiser.noise_scale_frame=0.25 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'
#IDEAL

design_10
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py \
inference.output_prefix=binders_outputs/design_10 \
inference.input_pdb=complex_short.pdb 'contigmap.contigs=[15-15/0 B1-145]' 'ppi.hotspot_res=[B36,B84,B126,B130]' \
diffuser.partial_T=30 \
inference.num_designs=10000 \
denoiser.noise_scale_ca=0.25 \
denoiser.noise_scale_frame=0.25 \
potentials.guiding_potentials=[\"type:binder_ROG,weight:1\"] potentials.guide_scale=10 potentials.guide_decay='linear'


