#! /bin/sh

whereis python 
#jupyter notebook --generate-config


iruby register --force;

mkdir -p  ${HOME}/.local/share/jupyter/kernels/gophernotes;
cd  ${HOME}/.local/share/jupyter/kernels/gophernotes;
cp $(go env GOPATH)/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  "."
chmod +w ./kernel.json
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json


PYDEVD_DISABLE_FILE_VALIDATION=1 

jupyter lab --ip 0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password='' --notebook-dir=/home/maxi/note