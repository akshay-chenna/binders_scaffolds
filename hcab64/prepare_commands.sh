pdb_selchain -C 8w0w.pdb | pdb_keepcoord | pdb_delhetatm | pdb_tidy > E2_8w0w.pdb
pdb_selchain -H 8w0w.pdb | pdb_keepcoord | pdb_delhetatm | pdb_tidy | pdb_fixinsert | pdb_reres -1 | pdb_selres -1:124 > H_8w0w.pdb
pdb_selchain -L 8w0w.pdb | pdb_keepcoord | pdb_delhetatm | pdb_tidy | pdb_fixinsert | pdb_reres -1 | pdb_selres -1:106 > L_8w0w.pdb
pdb_merge E2_8w0w.pdb H_8w0w.pdb L_8w0w.pdb | pdb_reatom -1 | pdb_tidy > 8w0w_clean.pdb

python find_E2_interface.py >> 8w0w_scaffolding.out
