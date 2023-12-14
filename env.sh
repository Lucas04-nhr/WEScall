#! /bin/zsh

echo "Do you want to set the environment variables for WEScall? (y/n)"
read -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
 then
   echo "Setting up environment variables for WEScall..."
   export PL_DIR=$HOME/WEScall

  if [[ -d "$HOME/WEScall/data" ]]
    then
      export WK_DIR=$HOME/WEScall/data
  else
      mkdir  "$HOME/WEScall/data"
      export WK_DIR=$HOME/WEScall/data
  fi
fi

echo "Successfully set up environment variables for WEScall!"

