
GFF1=../../AQULA_OGS1.0.gff3
GFF2=../../Supporting_non-OGS_data/Repeats/Alat1.3_ORL1.0-align.gff3.gz
gt gff3 -tidy -sort -retainids $GFF1 <(zcat $GFF2) > genes_repeats-merged.gff3

SBTFILE=$(readlink -f firefly_author_template_for_NCBI_v2.sbt)
GFFFILE=$(readlink -f genes_repeats-merged.gff3)
FASTAFILE=$(readlink -f ../../Alat1.4.fasta)
./mac.table2asn_GFF -M n -J -c w -euk -t ${SBTFILE} -gaps-min 10 -l paired-ends -j "[organism=Aquatica lateralis] [strain=Ikeya-Y90] [moltype=genomic DNA] [location=nucleus] [gcode=1]" -i ${FASTAFILE} -f ${GFFFILE} -o AQULA_genome.sqn -Z
