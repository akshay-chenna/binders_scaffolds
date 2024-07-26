qsub -P goelg.p2.520 -q test -N mpnn -l select=1:ncpus=20:ngpus=1:centos=icelake -l walltime=06:00:00 run_mpnn.sh
