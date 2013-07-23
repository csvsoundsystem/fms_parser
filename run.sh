#!/bin/sh
set -e

if [ -d env ]; then
  . ./env/bin/activate
  echo Activated virtualenv
  pip install --upgrade -r requirements.pip
fi

git checkout master
git pull origin master

# install crontab
cd ./utils
sh install_crontab.sh
cd ..

(
  cd ./parser
  python download_and_parse_fms_fixies.py
)
