#!/usr/bin/env bash

EXPECTED_TSC_VERSION='Version 5.5.0-beta'
TSC_VERSION="$(tsc -v)"
PACK_FILENAME="privateprefix-lib-1.0.0.tgz"

if [ ! "$TSC_VERSION" = "$EXPECTED_TSC_VERSION" ]; then
    echo "Wrong tsc version! (tsc -v)"
    echo "Expected: ""$EXPECTED_TSC_VERSION"
    echo "Got:      ""$TSC_VERSION"
    exit 1
fi

if [ -d "lib/dist" ]; then
    echo "cleaning up"
    rm "./lib/dist" && \
    rm "./lib/node_modules" && \
    rm "./lib/""$PACK_FILENAME" && \
    rm "./project/dist" && \
    rm "./project/node_modules"
fi

cd ./lib && \
npm ci && \
npm link --userconfig ../.npmrc && \
tsc -p tsconfig.json && \
npm pack && \
cd ../project && \
npm i "../lib/""$PACK_FILENAME" && \
npm link @privateprefix/lib --userconfig ../.npmrc

tsc -p tsconfig.json

RES="$?"

if [ ! "$RES" = "0" ]; then
    echo "Successfully demonstrated failure!"
    exit "$RES"
fi
