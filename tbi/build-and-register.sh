#!/bin/bash

TAG=saintpeter/bastion-9:latest

if [[ -z "$(minikube image list | grep $TAG)" ]]; then
  minikube image build --tag saintpeter/bastion-9:latest .

else
  echo "[WARN]$TAG already registered"
fi
