#!/usr/bin/env bash

./configure

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make $MAKE_PARAMS
  cp -r infer-out $OUT
elif [[ $1 == "codeql" ]]; then
  $CODEQL_BIN database create --language=cpp --command="make $MAKE_PARAMS" codeql-db
  cp -r codeql-db $OUT
else
  echo "Unknown build target"
  exit 1
fi
