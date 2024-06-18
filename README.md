# Error Demonstration for TypeScript

This error was tested in TypeScript 5.5.0-beta as of Tuesday 18.06.2024.

To get the error yourself, run the following on a clean repository:
```sh
cd ./lib && \
npm ci && \
npm link --userconfig ../.npmrc && \
tsc -p tsconfig.json && \
npm pack && \
cd ../project && \
npm i "../lib/""$PACK_FILENAME" && \
npm link @privateprefix/lib --userconfig ../.npmrc

tsc -p tsconfig.json
```

Or more simply, if you trust the shell script provided, run `./test.sh`.