#!/bin/bash

# This is the HISAT2 script for aligning fastq files

# run alignment

echo "Starting HISAT2 alignment..."

hisat2 -q -p 10 --rna-strandness FR -x /home/husseinf/RNASeq_pipeline/HISAT2/grch38/genome \
    -1 /home/husseinf/RNASeq_pipeline/data/S5_R1.fastq \
    -2 /home/husseinf/RNASeq_pipeline/data/S5_R2.fastq \
    -S S5_aligned.sam

# Check if any BAM file was created in the HISAT2 directory

if ! ls HISAT2/*.bam 1> /dev/null 2>&1; then
    echo "Error: No BAM file was created in the HISAT2 directory"
    exit 1
fi

echo "HISAT2 finished running!"


