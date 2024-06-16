#!/bin/bash

# Array of job names, instance files, and parameter files
JOB_NAMES=("helloworld_1" "helloworld_2" "helloworld_3")
INSTANCE_FILES=("c1.txt" "c2.txt" "c3.txt")
PARAM_FILES=("p1.txt" "p2.txt" "p3.txt")

for i in ${!JOB_NAMES[@]}; do
    JOB_NAME=${JOB_NAMES[$i]}
    INSTANCE_FILE=${INSTANCE_FILES[$i]}
    PARAM_FILE=${PARAM_FILES[$i]}

    echo "Submitting job: $JOB_NAME with instance file: $INSTANCE_FILE and param file: $PARAM_FILE"
    sbatch test.sh $INSTANCE_FILE $PARAM_FILE $JOB_NAME
done
