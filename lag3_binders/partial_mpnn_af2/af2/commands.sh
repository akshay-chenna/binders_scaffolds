qsub -P chemical -q test -N af2-1 -l select=1:ncpus=40:centos=icelake -l walltime=65:00:00 run_af2.sh 
# Took ~35 hrs for 300 structures per silent file
qsub -P chemical -q test -N af2-2 -l select=1:ncpus=40:centos=icelake -l walltime=65:00:00 run_af2.sh 
qsub -P chemical -q test -N af2-3 -l select=1:ncpus=40:centos=icelake -l walltime=65:00:00 run_af2.sh 

qsub -P chemical -q test -N af2-4 -l select=1:ncpus=40:centos=icelake -l walltime=35:00:00 run_af2.sh 


awk '$3 < 10 && $5 > 80 { print }' scores/*sc > passed.txt

while read -r l ; do grep "$l" scores/*sc >> passed_grep.txt ; done < passed.txt

cut -d . -f 1 passed_grep.txt | cut -d _ -f 2- > passed_files.txt
awk '{print }' passed_grep.txt > passed_pdbs.txt
 
