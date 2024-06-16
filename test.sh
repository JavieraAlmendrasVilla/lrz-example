#!/bin/bash
#
#SBATCH --account=ge85tuy2   # Replace with your SLURM account name
#SBATCH --partition=cm2_inter   # Replace with the partition you want to use
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=00:10:00   # Set a reasonable time limit for your job
#SBATCH --job-name=test_job   # A descriptive name for your job

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <instance_file> <param_file> <job_name>"
    exit 1
fi

# Run the Python script with the provided arguments
python3 helloworld.py "$1" "$2" "$3"
