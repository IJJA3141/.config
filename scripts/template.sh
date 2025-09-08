#!/bin/dash

if [ "$1" = "" ]; then
  echo "syntax error\nI give up."
  exit
fi

path=$(pwd)
cd /tmp || exit

git clone https://github.com/IJJA3141/templates

if [ ! -d "templates/$1" ]; then
  echo "$1 template not found\nI give up."
  rm -rf "templates"
  exit
fi

cp -r "templates/$1"/* "$path"/
rm -rf "templates"
