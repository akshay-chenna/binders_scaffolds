import MDAnalysis as mda
import numpy as np
u = mda.Universe('8w0w_clean.pdb','8w0w_clean.pdb')
x = u.select_atoms('chainID C and (around 6 (chainID H or chainID L))')
print(len(np.unique(x.resids)))
print(np.unique(x.resids))
