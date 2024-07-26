import MDAnalysis as mda
import numpy as np
import sys

u = mda.Universe(sys.argv[1],sys.argv[1])
x = u.select_atoms('chainID B and (around 8 chainID A)')
y = u.select_atoms('chainID A')
x = np.unique(x.resids-y.n_residues)

major_r = np.array([36,84,126,130])
all_r = np.array([36, 37, 38, 39, 40, 41, 79, 81, 83, 84, 85, 124, 126, 130, 131, 132, 133, 134, 135, 136])
intersect_major = len(np.intersect1d(x,major_r))/4
intersect_all = len(np.intersect1d(x,all_r))/20
a = np.array([intersect_major, intersect_all])
np.savetxt(sys.argv[2],a.reshape(1,2),fmt='%.2f',delimiter='\t')
