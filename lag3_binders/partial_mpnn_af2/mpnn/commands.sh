# More than 20 does not work
qsub -P chemical -q test -N mpnn-1 -l select=1:ncpus=20:ngpus=1:centos=icelake -l walltime=20:00:00 run_mpnn.sh
# takes ~12 hrs for 1500 designs
qsub -P chemical -q test -N mpnn-2 -l select=1:ncpus=20:ngpus=1:centos=icelake -l walltime=20:00:00 run_mpnn.sh
