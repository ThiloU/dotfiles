#!/bin/sh

echo "$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)%  $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)°C"
