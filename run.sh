#!/bin/bash

# Start the first process
jupyter notebook --ip=0.0.0.0 --port 8080 --no-browser --allow-root --notebook-dir=/data \
--NotebookApp.token='' --NotebookApp.password='' &


# Start the second process
jupyter lab --ip=0.0.0.0 --port 8081 --no-browser --allow-root --notebook-dir=/data \
--NotebookApp.token='' --NotebookApp.password='' &


# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?