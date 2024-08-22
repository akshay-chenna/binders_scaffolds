import sys
import os
import json
import matplotlib.pyplot as plt
import numpy as np
import tqdm.notebook
import jax
import tensorflow as tf
import time

sys.path.append('alphafold')
sys.path.append('ColabFold/beta')
os.environ['PATH'] += f":tmp/bin:tmp/scripts"
import ColabFold.beta.colabfold as cf
import colabfold_alphafold as cf_af

sequence = 'EVQLVESGGGLVQPGGSLRLSCAASGFTISDYWIHWVRQAPGKGLEWVAGITPAGGYTYYADSVKGRFTISADTSKNTAYLQMNSLRAEDTAVYYCARFVFFLPYAMDYWGQGTLVTVSS:DIQMTQSPSSLSASVGDRVTITCRASQDVSTAVAWYQQKPGKAPKLLIYSASFLYSGVPSRFSGSGSGTDFTLTISSLQPEDFATYYCQQSYTTPPTFGQGTKVEIK'
jobname = "2FJF"
homooligomer =  "1"
add_custom_msa = False
msa_format = "fas"
pair_mode = "unpaired"
pair_cov = 50
pair_qid = 20 
I = cf_af.prep_inputs(sequence, jobname, homooligomer)
TMP_DIR = "tmp"
msa_method = "mmseqs2"
I = cf_af.prep_msa(I, msa_method, add_custom_msa, msa_format,pair_mode, pair_cov, pair_qid,TMP_DIR=TMP_DIR)
mod_I = I
#No relaxation
num_relax = "None"

###    Parameters for running Alphafold
rank_by = "pLDDT"
use_turbo = True
max_msa = "08:16" 
max_msa_clusters, max_extra_msa = [int(x) for x in max_msa.split(":")]

show_images = False

num_models = 5
use_ptm = True
num_ensemble = 1
max_recycles = 1
is_training = True
num_samples = 128 
subsample_msa = True

if not use_ptm and rank_by == "pTMscore":
  print("WARNING: models will be ranked by pLDDT, 'use_ptm' is needed to compute pTMscore")
  rank_by = "pLDDT"

# prep input features
feature_dict = cf_af.prep_feats(mod_I)
Ls_plot = feature_dict["Ls"]

# prep model options
opt = {"N":len(feature_dict["msa"]),
      "L":len(feature_dict["residue_index"]),
      "use_ptm":use_ptm,
      "use_turbo":use_turbo,
      "max_recycles":max_recycles,
      "tol":0.0,
      "num_ensemble":num_ensemble,
      "max_msa_clusters":max_msa_clusters,
      "max_extra_msa":max_extra_msa,
      "is_training":is_training}

if use_turbo:
  if "runner" in dir():
    # only recompile if options changed
    runner = cf_af.prep_model_runner(opt, old_runner=runner)
  else:
    runner = cf_af.prep_model_runner(opt)
else:
  runner = None

###    Run Alphafold with low MSA
t1 = time.perf_counter()
outs, model_rank = cf_af.run_alphafold(feature_dict, opt, runner, num_models, num_samples, subsample_msa,
                                      rank_by=rank_by, show_images=show_images)

###    Output folder

structures_path='./content/Structures'   #Output_folder
os.makedirs(structures_path)
file_path=os.path.join(structures_path,'file_details.txt')
with open(file_path, "w") as file_details:
  line_start=f"total:{num_samples*5}"
  file_details.write(line_start+"\n")
  for n,key in enumerate(model_rank):
    copy_line=f'cp {I["output_dir"]}/rank_{n+1}_{key}_unrelaxed.pdb {structures_path}/pred_{n+1}.pdb'
    os.system(copy_line)
    if num_relax !="None":
      if n<num_relax:
        copy_line2=f'cp {I["output_dir"]}/rank_{n+1}_{key}_relaxed.pdb {structures_path}/pred_{n+1}.pdb'
        os.system(copy_line2)
    line = f"pred_{n+1}.pdb pLDDT:{outs[key]['pLDDT']:.2f}" + f" pTMscore:{outs[key]['pTMscore']:.4f}" if use_ptm else ""
    file_details.write(line+"\n")

t2 = time.perf_counter()

print(f'\nTime taken to generate:{(t2-t1)/60:.2f} mins')
print(f'The structures can be found in {structures_path}')
