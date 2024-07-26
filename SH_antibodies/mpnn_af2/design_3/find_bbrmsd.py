import numpy as np
import MDAnalysis as mda
import sys
from MDAnalysis.analysis.rms import RMSD

def find_rmsd(u,v):
        u = mda.Universe(u)
        u = u.select_atoms('chainID A and backbone')
        v = mda.Universe(v)
        v = v.select_atoms('chainID A and backbone')

        a = RMSD(v,u).run().rmsd[:,2]
        return float(a)

for i in range(1,7):
        print(find_rmsd(str(i)+'_af2.pdb',str(i)+'_mpnn.pdb'))
