#!/bin/sh

# echo "︁ $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%  $(sensors coretemp-isa-0000| grep -A 0 'Package id 0' | cut -c17-18)°C"
echo "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%  $(sensors coretemp-isa-0000| grep -A 0 'Package id 0' | cut -c17-18)°C"
