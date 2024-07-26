
# Add fixed label to motif of binder:
python ~/apps/dl_binder_design/helper_scripts/addFIXEDlabels.py --pdbdir . --trbdir .

# Convert to silent
silentfrompdbs design_3_*.pdb > design_3.silent

# qsub
qsub -P chemical -q standard -N rfd -l select=1:ngpus=1:ncpus=1:centos=skylake -l walltime=24:00:00 design_scaffold_2.sh
