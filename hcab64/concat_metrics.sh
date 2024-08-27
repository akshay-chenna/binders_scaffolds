cat af2*/rmsd.out >> all_rmsds.out
paste -d ' '  - - < all_rmsds.out > temp.txt
mv temp.txt all_rmsds.out
sed -i '1i\folder\tname\tbinder_AA\tbinder_BB\tbinder_CA\tmotif_AA\tmotif_BB\tmotif_CA' all_rmsds.out

cat af2*/plddts.out >> all_plddts.out
sed -i '1i\name\tBinder\tScaffold\tMotif' all_plddts.out

