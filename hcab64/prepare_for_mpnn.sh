# Add fixed labels
~/apps/dl_binder_design/helper_scripts/addFIXEDlabels.py --pdbdir . --trbdir . --verbose

# We want MPNN to re-design the broken cystein
for i in *.pdb
do
        a=`grep -n "FIXED" $i | cut -d : -f 1 | sed -n 3p`
        sed -i "${a}d" $i
done

# Create a single silent file for all pdbs
/home/paperspace/apps/silent_tools/silentfrompdbs 8w0w_C1_*.pdb > rfd_8w0w_C1.silent
