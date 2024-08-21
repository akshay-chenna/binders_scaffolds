import numpy as np
import MDAnalysis as mda
import sys
from MDAnalysis.analysis.rms import RMSD

def binder_ca_rmsd(u,v):
        u = mda.Universe(u)
        u = u.select_atoms('chainID A and name CA')
        v = mda.Universe(v)
        v = v.select_atoms('chainID A and name CA')

        a = RMSD(v,u).run().rmsd[:,2]
        return float(a)

def binder_bb_rmsd(u,v):
        u = mda.Universe(u)
        u = u.select_atoms('chainID A and backbone')
        v = mda.Universe(v)
        v = v.select_atoms('chainID A and backbone')

        a = RMSD(v,u).run().rmsd[:,2]
        return float(a)

def binder_aa_rmsd(u,v):
        u = mda.Universe(u)
        x = u.residues.segments[0]
        x = x.residues.n_residues
        u = u.select_atoms('chainID A and resid 2:' + str(x-2))
        v = mda.Universe(v)
        v = v.select_atoms('chainID A and resid 2:' + str(x-2))

        a = RMSD(v,u).run().rmsd[:,2]
        return float(a)

with open(sys.argv[3]) as f:
    l = f.readlines()[0].strip()

def motif_ca_rmsd(u,v):
        u = mda.Universe(u)
        u = u.select_atoms('chainID A and (name CA and (' + l + '))')
        v = mda.Universe(v)
        v = v.select_atoms('chainID A and (name CA and (' + l + '))')

        a = RMSD(v,u).run().rmsd[:,2]
        return float(a)

def motif_bb_rmsd(u,v):
        u = mda.Universe(u)
        u = u.select_atoms('chainID A and (backbone and (' + l + ') )')
        v = mda.Universe(v)
        v = v.select_atoms('chainID A and (backbone and (' + l + ') )')

        a = RMSD(v,u).run().rmsd[:,2]
        return float(a)

def motif_aa_rmsd(u,v):
        u = mda.Universe(u)
        u = u.select_atoms('chainID A and (' + l + ')')
        v = mda.Universe(v)
        v = v.select_atoms('chainID A and (' + l + ')')

        a = RMSD(v,u).run().rmsd[:,2]
        return float(a)

b1 = binder_ca_rmsd(sys.argv[1], sys.argv[2])
b2 = binder_bb_rmsd(sys.argv[1], sys.argv[2])
b3 = binder_aa_rmsd(sys.argv[1], sys.argv[2])

m1 = motif_ca_rmsd(sys.argv[1], sys.argv[2])
m2 = motif_bb_rmsd(sys.argv[1], sys.argv[2])
m3 = motif_aa_rmsd(sys.argv[1], sys.argv[2])

print(b1,b2,b3,m1,m2,m3,sep='\t')
