#! /bin/bash

echo "Do you want to set the environment variables for Bowtie tool? ([Y]/n)"
read -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]
then
  echo -e "Please enter the \033[1;31mABSOLUTE\033[0m path for Bowtie tool:"
  read bowtie_path

  counter=0

  while [[ $counter -lt 10 ]]; do
    echo "Setting up environment variables for Bowtie tool..."
    export PATH=$PATH:${bowtie_path} >> ~/.bashrc
    export BOWTIE_DIR=${bowtie_path} >> ~/.bashrc

    if [[ -z "$BOWTIE_DIR" ]]
    then
      echo "Failed to set up environment variables. Retrying..."
    else
      echo "Successfully set up environment variables for Bowtie tool!"
      break
    fi

    counter=$((counter + 1))
  done

  if [[ $counter -eq 10 ]]
  then
    echo "Failed to set up environment variables after 10 attempts. Exiting..."
  fi
fi
