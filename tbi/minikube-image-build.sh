#!/bin/bash

TAG=saintpeter/bastion-9:latest
SCRIPTNAME=$0
SCRIPTDIR=$(
  cd "$(dirname $SCRIPTNAME)"
  echo $PWD
)

cd $SCRIPTDIR


if [[ -z "$(minikube image list | grep $TAG)" ]]; then
  echo "[INFO]Building the bastion host image in minikube. Please be patient"
  minikube image build --tag saintpeter/bastion-9:latest .
else
  echo "[WARN]$TAG already registered in minikube"
fi
