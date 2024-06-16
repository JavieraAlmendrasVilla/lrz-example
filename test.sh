#!/bin/bash
#SBATCH --account=ge85tuy2   # Account name
#SBATCH --partition=cm2_inter   # Partition name
#SBATCH --nodes=1             # Number of nodes
#SBATCH --cpus-per-task=1     # Number of CPUs per task
#SBATCH --mem=1G              # Memory per node (adjust as needed)
#SBATCH --time=00:10:00       # Walltime

# Print SLURM job information
echo "SLURM_JOB_ID: $SLURM_JOB_ID"
echo "SLURM_JOB_NAME: $SLURM_JOB_NAME"
echo "SLURM_NODELIST: $SLURM_NODELIST"

# Load necessary modules (if required)
# module load <module_name>

# Commands to run your job
echo "Hello, this is a test job!"
echo "Current working directory: $(pwd)"
echo "Job started on $(hostname) at $(date)"

# Optional: Run your actual job commands here

# End of script
