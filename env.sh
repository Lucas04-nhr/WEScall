#! /bin/bash

echo "Do you want to set the environment variables for WEScall? ([Y]/n)"
read -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]
then
  echo -e "Please enter the \033[1;31mRELATIVE\033[0m path for WK_DIR:"
  read wk_dir_path

  counter=0

  while [[ $counter -lt 10 ]]; do
    echo "Setting up environment variables for WEScall..."
    export PL_DIR=${PWD}/WEScall

    if [[ -d "${PWD}/WEScall/${wk_dir_path}" ]]
    then
      export WK_DIR=${PWD}/WEScall/${wk_dir_path}
    else
      mkdir  "${PWD}/WEScall/${wk_dir_path}"
      export WK_DIR=${PWD}/WEScall/${wk_dir_path}
    fi

    if [[ -z "$PL_DIR" || -z "$WK_DIR" ]]
    then
      echo "Failed to set up environment variables. Retrying..."
    else
      echo "Successfully set up environment variables for WEScall!"
      break
    fi

    counter=$((counter + 1))
  done

  if [[ $counter -eq 10 ]]
  then
    echo "Failed to set up environment variables after 10 attempts. Exiting..."
  fi
fi
