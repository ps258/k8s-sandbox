#!/bin/bash

TAG=saintpeter/bastion-9:latest

if [[ -z "$(docker image list -q $TAG)" ]]; then
  docker image build --no-cache --progress=plain --tag saintpeter/bastion-9:latest .

  docker save --output image.tar $TAG
  eval $(minikube docker-env)
  docker load --input image.tar
  rm image.tar
  eval $(minikube docker-env -u)
else
  echo "[WARN]$TAG already registered"
fi
