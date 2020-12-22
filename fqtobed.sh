#!/bin/bash

minimap2 -t 12 -ax splice -uf -k14 -G2k --secondary=no moss_ref.fasta $1/pass/*.fastq | samtools view -bS | samtools sort  -o $1.bam;
bedtools bamtobed  -bed12 -i  $1.bam > $1.bed;
bedtools merge -s -n -i $1.bed > merge_$1.bed;

samtools index $1.bam;
samtools flagstat $1.bam;

