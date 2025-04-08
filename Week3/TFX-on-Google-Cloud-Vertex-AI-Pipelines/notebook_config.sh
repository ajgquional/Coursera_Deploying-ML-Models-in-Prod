  #!/bin/bash -e
  echo "STARTUP-SCRIPT: START"

  # Copy the notebook and requirements.txt files from the storage bucket
  sudo -u jupyter gsutil cp gs://qwiklabs-gcp-00-534c107a8c69-labconfig-bucket/vertex_pipelines_simple-v1.0.0.ipynb /home/jupyter/vertex_pipelines_simple-v1.0.0.ipynb
  sudo -u jupyter gsutil cp gs://qwiklabs-gcp-00-534c107a8c69-labconfig-bucket/requirements.txt /home/jupyter/
  # Install required python packages
  pip install --upgrade --no-warn-conflicts --no-warn-script-location -r /home/jupyter/requirements.txt
  cd ~ && cd /home/jupyter/
  jupyter nbconvert --clear-output --inplace vertex_pipelines_simple-v1.0.0.ipynb
  echo "STARTUP-SCRIPT: END"
