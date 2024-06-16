from __future__ import print_function
import sys
import os
from pathlib import Path
import numpy
import pandas
import gurobipy
import time

time.sleep(10)
print("Number of arguments:", len(sys.argv), "arguments.")
print("Argument List:", str(sys.argv))

instance_file_name = sys.argv[1] # Will be c1.txt
param_file_name = sys.argv[2] # Will be p1.txt
job_name = sys.argv[3] # Will be helloworld_1
# OTHER_CMD_ARGUMENT=$3 # If we had 4 columns in run_list.csv (3 minus the run name)

# We could do something with these files here
# data/ will exist locally
# cat data/${INSTANCE_FILE_NAME}
# cat data/${PARAM_FILE_NAME}

# Log some stuff

# Log to console (STDOUT)
print("Will contain the console output of your program, i.e., written with print() (captures STDOUT).", file=sys.stdout)
print("List invididual parameters passed:")
print("INSTANCE_FILE_NAME: {}".format(instance_file_name))
print("PARAM_FILE_NAME: {}".format(param_file_name))
print("List all parameters passed: {}".format(str(sys.argv)))
# Log to STDERR

path_to_data = Path(__file__).parent / f"data"
with open(path_to_data / f"{instance_file_name}", "r") as f:
    instance = f.readlines()
with open(path_to_data / f"{param_file_name}", "r") as f:
    params = f.readlines()


# Write some results
os.makedirs(f"results/{job_name}", exist_ok=True)
with open(f"results/{job_name}/{instance_file_name}_{param_file_name}_results_1.csv", "w") as f:
    f.write("A file written to results/ by your program.")

with open(f"results/{job_name}/{instance_file_name}_{param_file_name}_results_2", "w") as f:
    f.write("Another file written to results/ by your program")

# Exit with a non 0 error code. This indicates that an error occured.
# If we instead exited with 0, no files would be written to error-logs
sys.exit(0)
