#Merge fastq
cat */*_1.fastq > merged_1.fastq 
cat */*_2.fastq > merged_2.fastq

#assembly
megahit -1 merged_1.fastq -2 merged_2.fastq -o megahit_out

#Binning
metawrap binning -a output_megahit/final.contigs.fa -o metawrap_out -t 9 -m 100 --metabat2 --maxbin2 --concoct */*fastq

#Bin refinement
metawrap bin_refinement -o output_refinement -t 9 -m 80 -A concoct_bins/ -B maxbin2_bins/ -C metabat2_bins/

#Clssify
metawrap classify_bins -b refined_bins/metawrap_70_10_bins/ -o classified_out -t 10

#GTDBTK
