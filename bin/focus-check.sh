#!/usr/bin/env bash

for path in ${BASH_ARGV[*]} ; do
  # Check for focus rockets
  egrep "\(['\"]\s*=>" $path -nr
  if [ "$?" == "0" ]; then
    echo; echo "Tests contain focus rockets!"; exit 1
  fi

  # Check for only calls
  grep ".only(" $path -nr
  if [ "$?" == "0" ]; then
    echo; echo "Tests contain .only statements!"; exit 1
  fi
done
