import numpy as np
import glob

all_files = glob.glob("outputs_norestraints/*.npz",recursive=True)
iptm_data = []
for f in all_files:
        with np.load(f) as data:
                if 'iptm' in data:
                        iptm_data.append(data['iptm'])
l = np.array(all_files)
l = l[np.argsort(np.concatenate(iptm_data))]
np.save('top_structure_worsttobest_norestraints.npy',l)
