#!/usr/bin/env bash

bin/focus-check.sh test/failures/focus-rocket.js >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo "Focus rocket test did not work..."; exit 1
fi

bin/focus-check.sh test/failures/only.js >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo ".only statement test did not work..."; exit 1
fi

bin/focus-check.sh test/failures/* >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo "Wildcard test did not work..."; exit 1
fi

bin/focus-check.sh test/**/*.js >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo "Wider wildcard test did not work..."; exit 1
fi
