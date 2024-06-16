#!/bin/bash
#SBATCH --job-name=batch_jobs         # Job name
#SBATCH --ntasks=1                    # Number of tasks
#SBATCH --cpus-per-task=1             # Number of CPU cores per task
#SBATCH --mem=500M                    # Memory per node
#SBATCH --time=01:00:00               # Time limit hrs:min:sec
#SBATCH --clusters=inter                # Cluster name
#SBATCH --partition=cm2_inter_large_mem  # Partition name
#SBATCH --output=slurm-log.out        # SLURM output file

# Ensure logs and error-logs directories exist
mkdir -p logs error-logs slurm-logs/batch_jobs

# Load modules or environment if needed
module unload python
module load miniconda3
conda init bash > /dev/null 2>&1
# shellcheck disable=SC1090
source ~/.bashrc > /dev/null 2>&1

conda activate py39 > /dev/null 2>&1
module load cmake/
module load gcc/11
module load gdal/3.3.3
module load gurobi/10.00

# Print out the host ID
echo "Host ID: $(hostid)"

export GRB_LICENSE_FILE=../gurobi.lic

# Run the script for each experiment listed in run_list.csv
pids=()
while IFS=',' read -r run_name arg1 arg2; do
    echo "Running job: $run_name with arguments: $arg1 $arg2"

    # Create subdirectories for logs and error-logs based on the job name
    mkdir -p logs/$run_name error-logs/$run_name slurm-logs/$run_name

    # Run the job and save output and error logs in the respective subfolders
    srun --job-name=$run_name \
         --output=logs/$run_name/output.log \
         --error=error-logs/$run_name/error.log \
         python helloworld.py "$arg1" "$arg2" "$run_name" &

    # Capture the PID of the srun command
    pids+=($!)

done < run_list.csv

# Move the SLURM output file to the appropriate job log directory
mv slurm-log.out slurm-logs/batch_jobs/

# Wait for all background jobs to finish
for pid in "${pids[@]}"; do
    wait $pid
done
