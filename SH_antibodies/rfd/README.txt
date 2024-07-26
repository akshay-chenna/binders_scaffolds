
#design_1: (designs appeared more correct to the eye than design_2)
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py inference.output_prefix=binders_outputs/design_1 inference.input_pdb=7raq_fv_sh_0002.pdb 'contigmap.contigs=[H1-124/0 L1-107/0 25-50/P1-15]' inference.num_designs=100 inference.ckpt_override_path=/home/chemical/phd/chz198152/apps/RFdiffusion/models/ActiveSite_ckpt.pt 

#design_2: (not preferred, since giving long exteneded helices)
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py inference.output_prefix=binders_outputs/design_2 inference.input_pdb=7raq_fv_sh_0002.pdb 'contigmap.contigs=[H1-124/0 L1-107/0 25-50/P1-15]' inference.num_designs=100 inference.ckpt_override_path=/home/chemical/phd/chz198152/apps/RFdiffusion/models/Complex_base_ckpt.pt

#design_3:
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py inference.output_prefix=binders_outputs/design_3 inference.input_pdb=7raq_fv_sh_0002.pdb 'contigmap.contigs=[H1-124/0 L1-107/0 25-70/P1-15]' inference.num_designs=100 inference.ckpt_override_path=/home/chemical/phd/chz198152/apps/RFdiffusion/models/ActiveSite_ckpt.pt 

#design_4:
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py inference.output_prefix=binders_outputs/design_4 inference.input_pdb=7raq_fv_sh_0002.pdb 'contigmap.contigs=[H1-124/0 L1-107/0 10-75/P1-15/10-75]' inference.num_designs=1000 inference.ckpt_override_path=/home/chemical/phd/chz198152/apps/RFdiffusion/models/ActiveSite_ckpt.pt 

#design_5:
/home/chemical/phd/chz198152/apps/RFdiffusion/scripts/run_inference.py inference.output_prefix=binders_outputs/design_5 inference.input_pdb=7raq_fv_sh_0002.pdb 'contigmap.contigs=[H1-124/0 L1-107/0 10-100/P1-15/10-100]' inference.num_designs=400 inference.ckpt_override_path=/home/chemical/phd/chz198152/apps/RFdiffusion/models/ActiveSite_ckpt.pt 
