#!/bin/bash

TAG=saintpeter/bastion-9:latest
SCRIPTNAME=$0
SCRIPTDIR=$(
  cd "$(dirname $SCRIPTNAME)"
  echo $PWD
)

cd $SCRIPTDIR

if sudo k3s ctr images list | grep -q bastion-9:latest ; then
  echo "[WARN]$TAG already registered in k3s"
  # it can be removed with 'sudo k3s ctr images remove $TAG'
else
  echo "[INFO]Building the bastion host image in k3s. Please be patient"
  if ! docker image list $TAG | grep -q $TAG; then
    docker build -t $TAG .
  fi
  docker save $TAG | sudo k3s ctr images import -
  echo "[INFO]Image $TAG is now available in k3s"
fi
