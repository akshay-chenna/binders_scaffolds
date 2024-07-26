# Submit MPNN
qsub -P goelg.p2.520 -q test -N mpnn -l select=1:ncpus=20:ngpus=1:centos=icelake -l walltime=06:00:00 run_mpnn.sh

# Submit AF2
qsub -P goelg.p2.520 -q test -N af2 -l select=1:ncpus=20:centos=icelake -l walltime=20:00:00 -W depend=afterok:3622462 run_af2.sh

# Other

awk '$2 <5 && $3 < 10 && $5 > 80 { print }' *sc >> passed.txt
while read -r l ; do grep "$l" *sc >> passed_grep.txt ; done < passed.txt
cut -d . -f 1 passed_grep.txt | cut -d _ -f 2- > passed_files.txt
awk '{print $NF }' passed_grep.txt > passed_pdbs.txt

bash extract.sh
