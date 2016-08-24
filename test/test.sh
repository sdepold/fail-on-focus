#!/usr/bin/env bash

bin/fail-on-focus.js test/failures/focus-rocket.js >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo "Focus rocket test did not work..."; exit 1
fi

bin/fail-on-focus.js test/failures/only.js >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo ".only statement test did not work..."; exit 1
fi

bin/fail-on-focus.js test/failures/* >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo "Wildcard test did not work..."; exit 1
fi

bin/fail-on-focus.js test/**/*.js >/dev/null 2>&1
if [ "$?" != "1" ]; then
  echo "Double wildcard test did not work..."; exit 1
fi
