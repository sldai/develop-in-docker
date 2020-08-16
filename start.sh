#!/bin/bash
source /etc/bash.bashrc
service ssh start
jupyter notebook --notebook-dir=$WORKSPACE_HOME --ip 0.0.0.0 --port ${JUPYTER_PORT} --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''