#!/bin/sh
mem=$(awk '/^Mem/ {print $3}' <(free -m))


if [[ ${#mem} < 4 ]]; then
  echo 0.${mem:0:2}
elif [[ ${#mem} > 4 ]]; then
  echo ${mem:0:2}.${mem:3:4}
elif [[ ${#mem} -eq 4 ]]; then
  echo ${mem:0:1}.${mem:2:3}
else
  echo WTF
fi
