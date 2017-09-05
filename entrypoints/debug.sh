#!/bin/sh
set -e

npm install
npm cache clean
npm run lint
# npm run test
# remove karma temp folder as is not being removed by karma itself
# echo "Removing temp karma and typescript folders..."
# rm -rf /build/karma-* /build/ts-node-*
npm run start
