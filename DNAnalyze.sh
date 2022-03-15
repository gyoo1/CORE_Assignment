#!/bin/bash

#1. Create 100 input files containing 1000 bases of data

for count in $(seq -f %03g 1 100) #format loop numbers to always have 3 digits
do
	name="DNAseq$count" 						#format file names to be in the form DNASeqNNN
	python -c "import DNAgen; DNAgen.DNAgen('$name', 1000)" 	#call custom python function for generating DNA sequences
done 


#2. Calculate counts for each base type

for filename in ./*.seq;
do
	file=$(echo ${filename:2:9})					#extract filenames
	Rscript -e "source('BASE.R'); bp.DNA('$file')"			#call custom R function for counting number of bases
done


#3. Combine results into a single csv file

for filename2 in ./*count;
do
	cat $filename2 >> BaseCounts.csv 				#output csv contains counts for each base type in 100 rows of 4 columns
done	
