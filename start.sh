#!/bin/bash
source /etc/bash.bashrc
service ssh start
jupyter notebook --notebook-dir=$HOME --ip 0.0.0.0 --port ${WORKSPACE_PORT} --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''