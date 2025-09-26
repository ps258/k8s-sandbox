#!/bin/bash

TAG=saintpeter/bastion-9:latest
SCRIPTNAME=$0
SCRIPTDIR=$(
  cd "$(dirname $SCRIPTNAME)"
  echo $PWD
)

cd $SCRIPTDIR

echo "[INFO]Building the bastion host image in minikube. Please be patient"

if [[ -z "$(minikube image list | grep $TAG)" ]]; then
  minikube image build --tag saintpeter/bastion-9:latest .
else
  echo "[WARN]$TAG already registered"
fi
