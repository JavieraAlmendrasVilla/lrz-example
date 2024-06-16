#!/bin/bash
#
#SBATCH --account=ge85tuy2   # Replace with your SLURM account name
#SBATCH --partition=cm2_inter   # Replace with the partition you want to use
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

# Commands to run
python helloworld.py
